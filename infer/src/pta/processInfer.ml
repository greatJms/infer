open! IStd
open PtaDomain
module L = Logging
module F = Format


let contains s1 s2 =
  let re = Str.regexp_string s2
  in
    try ignore (Str.search_forward re s1 0); true
    with _ -> false

let rec filter_allocs_from_instrs instrs proc_name =
  match instrs with
    | [] -> []
    | instr :: tail ->
      (match instr with
        | Sil.Call ((retId,_), fexp, _, _, _) ->
          let fun_name = Exp.to_string fexp in
	  if contains fun_name "__new" then 
            (
            let var = proc_name^"/"^(Ident.to_string retId) in
            let heap = proc_name^"/"^(Ident.to_string retId) in
            (*Alloc (Var var,Heap heap,Meth proc_name)*)
            (Alloc (Var var, Heap heap,Meth proc_name))::filter_allocs_from_instrs tail proc_name)
        else
          filter_allocs_from_instrs tail proc_name
        | _-> filter_allocs_from_instrs tail proc_name
      )

let process_a_proc proc = 
  let proc_name = Procname.to_string proc in 
  let proc_desc = Procdesc.load proc in
  let nodes = 
    (match proc_desc with
      | Some desc -> Procdesc.get_nodes desc
      | None -> []) in
  let instrs = List.concat_map nodes
    ~f: (fun e -> Array.to_list (Instrs.get_underlying_not_reversed (Procdesc.Node.get_instrs e))) in
  let allocs = filter_allocs_from_instrs instrs proc_name in
  allocs

let rec process_procs procs allocs = 
  match procs with
    | [] -> allocs 
    | proc::tail ->
      let allocs = allocs @ (process_a_proc proc) in
        process_procs tail allocs
                  
let pgm_to_inputRelations () =
  let allocs = [] in 
  L.progress "- SourceFiles begins ...@." ;
  let file_list = SourceFiles.get_all ~filter:(fun _ -> true) () in
  List.iter file_list ~f: (fun e -> L.progress "SourceFile:%a@." IBase.SourceFile.pp e);
  L.progress "- SourceFiles ends ...@.";
  let proc_list = List.concat_map file_list ~f: (fun e -> SourceFiles.proc_names_of_source e) in
  L.progress "- Procs begins ...@." ;
  List.iter proc_list ~f: (fun e -> L.progress "Proc : %a@." Procname.pp e);
  L.progress "- Procs ends ...@." ;
  let allocs = process_procs proc_list allocs in
  let inputRelations = {allocs = allocs} in
  inputRelations
        
       
