open! IStd
module L = Logging
module F = Format


let test_driver () =
  print_endline "ddd"
  (*
  prerr_step_begin "Running pre-analysis" ;
  let pre = generate_global () in
  (* Calculate Global *)
  (* Translate a program into a set of instructions *)
  L.progress "- Fetching fffffffffffff source files ...@." ;
  let source_files_all = SourceFiles.get_all ~filter:(fun _ -> true) () in
  let file_list = SourceFiles.get_all ~filter:(fun _ -> true) () in
  L.progress "- SourceFiles begins ...@." ;
  List.iter file_list (fun e -> L.progress "SourceFile:%a@." IBase.SourceFile.pp e);
  L.progress "- SourceFiles ends ...@.";
  let proc_list = List.concat_map file_list (fun e -> SourceFiles.proc_names_of_source e) in
  (*let proc_list = source_list_to_proc_list file_list in*) (*ProcName.t list*)
  L.progress "- Procs begins ...@." ;
  List.iter proc_list (fun e -> L.progress "Proc : %a@." Procname.pp e);
  L.progress "- Procs ends ...@." ;
  let proc_desc_list = List.map proc_list (fun e -> Procdesc.load e) in
  (*let proc_desc_list = proc_list_to_procdesc_list proc_list in*)
  L.progress "- Proc_desc begins ...@." ;
  Die.exit 0
  *)



let main () = test_driver ()
