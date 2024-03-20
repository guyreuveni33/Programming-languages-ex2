
let default_state x = 0;;

let number n = n 0;;

let rec aritmetic_semantic e s = match e with
  | Num n ->  number n
  | Var x -> s x
  | Add (e1, e2) ->aritmetic_semantic e1 s +aritmetic_semantic e2 s
  | Mult (e1, e2) -> aritmetic_semantic e1 s * aritmetic_semantic e2 s
  | Sub (e1, e2) -> aritmetic_semantic e1 s - aritmetic_semantic e2 s


let rec boolean_semantic e s =
  match e with
  | TT -> true
  | FF -> false
  | Neg e1 -> not (boolean_semantic e1 s)
  | Beq (e1, e2) -> (boolean_semantic e1 s = boolean_semantic e2 s)
  | Aeq (e1, e2) -> (aritmetic_semantic e1 s = aritmetic_semantic e2 s)
  | And (e1, e2) -> (boolean_semantic e1 s && boolean_semantic e2 s)
  | Leq (e1, e2) -> (aritmetic_semantic e1 s <= aritmetic_semantic e2 s)

let create_state prev_state x e =((fun y ->
    if x = y then
      aritmetic_semantic e prev_state
    else
      aritmetic_semantic (Var y) prev_state ): state ) ;;


let rec nos c = match c with
  | (Ass (x, e), s) -> create_state s x e
  | (Skip, s) -> s
  | (Comp (s1, s2), s) -> nos (s2, nos(s1, s))
  | (If (b, s1, s2), s) -> if boolean_semantic b s then nos (s1, s) else nos (s2, s)
  | (While (b, s1), s) -> if boolean_semantic b s then nos (While (b, s1),nos (s1, s)) else nos (Skip, s)
  | (If_Ass (x, e,stm1,stm2), s) -> let new_state = create_state s x e in
      if boolean_semantic (Aeq (e , Num (fun t -> 0))) s then nos(stm2, new_state) else nos(stm1, new_state)
  |(Repeat (s1, b), s) ->
      let new_state = nos (s1, s) in
      if boolean_semantic b new_state then
        nos (s1, s)  else nos (Repeat(s1 ,b),nos(s1,s));;

