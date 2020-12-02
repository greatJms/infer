open! IStd
open PtaDomain
open ProcessInfer 
open Printf
module L = Logging
module F = Format


let rec printAllocs allocs = 
  match allocs with
    | [] ->()
    | Alloc (Var var, Heap heap, Meth meth)::tail ->
      printf "var : %s  heap : %s  meth : %s \n" var heap meth; 
      printAllocs tail




let preprocessInfer () = pgm_to_inputRelations ()


let main inputRelations = (*test_driver ()*)
  let allocs = inputRelations.allocs in
  printAllocs allocs; 
  ()
