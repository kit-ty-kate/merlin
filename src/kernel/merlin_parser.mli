(* {{{ COPYING *(

  This file is part of Merlin, an helper for ocaml editors

  Copyright (C) 2013 - 2015  Frédéric Bour  <frederic.bour(_)lakaban.net>
                             Thomas Refis  <refis.thomas(_)gmail.com>
                             Simon Castellan  <simon.castellan(_)iuwt.fr>

  Permission is hereby granted, free of charge, to any person obtaining a
  copy of this software and associated documentation files (the "Software"),
  to deal in the Software without restriction, including without limitation the
  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
  sell copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  The Software is provided "as is", without warranty of any kind, express or
  implied, including but not limited to the warranties of merchantability,
  fitness for a particular purpose and noninfringement. In no event shall
  the authors or copyright holders be liable for any claim, damages or other
  liability, whether in an action of contract, tort or otherwise, arising
  from, out of or in connection with the software or the use or other dealings
  in the Software.

)* }}} *)

open Std
open Inuit_stub

type kind =
  | ML
  | MLI
  (*| MLL | MLY*)

type t

val make : Merlin_lexer.t -> kind -> t
val update : Merlin_lexer.t -> t -> t

val trace : t -> _ cursor Nav.frame -> unit

type tree = [
  | `Signature of Parsetree.signature
  | `Structure of Parsetree.structure
]

val result : t -> tree

val errors : t -> exn list

val lexer : t -> Merlin_lexer.t
val compare : t -> t -> int

val dump_stack : t -> _ cursor -> Merlin_lexer.triple -> unit
