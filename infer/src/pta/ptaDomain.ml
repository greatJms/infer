
type variable = Var of string
type heap = Heap of string (*Instr ??*)
type signature = Signature of string (*ToDo*)
type field = Field of string
type instruction = Instruction of string
type heapType = Type of string (*ToDo*)
type index = Index of int
type meth = Meth of string (*ToDo*)

(*
type Ctx = ?? 
type HCtx = ??  
*)


type alloc = Alloc of variable * heap * meth
type refAssign = RefAssign of variable * variable * meth
type copy = Copy of variable * variable
type loadFld = LoadFld of variable * variable * meth
type storeFld = StoreFld of variable * field * meth 
type loadArrPtr = LoadArrPtr of variable * variable * meth
type storeArrPtr = StoreArrPtr of variable * variable * meth
type vCall = VCall of variable * signature * instruction * meth
type sCall = SCall of meth * instruction * variable * meth


type formalArg = FormalArg of meth * index * variable 
type actualArg = ActualArg of instruction * index * variable
type formalRet = FormalRet of meth * variable
type actualRet = ActualRet of instruction * variable
(*
type HeapType = Heap * Type
type LookUp = 
*)



type inputRelations = {allocs : alloc list} 
(*
type inputRelations = 
  {allocs : alloc list ; refAssigns : refAssign list ; copys : copy list ; loadFlds : loadFld list ; storeFlds : storeFld list ; loadArrPtrs : loadArrPtr list ; storeArrPtr : storeArrPtr list ; vCalls : vCall list ; sCall : sCall list ; formalArgs : formalArg list ; actualArgs : actualArg list ; actualRets : actualRet list } 
*)


