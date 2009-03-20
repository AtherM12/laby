
(*
 * Copyright (C) 2007-2009 The laby team
 * You have permission to copy, modify, and redistribute under the
 * terms of the GPL-3.0. For full license terms, see gpl-3.0.txt.
 *)

let dev_null =
  Unix.openfile "/dev/null" [Unix.O_RDWR] 0

let play name =
  let sound_play = Res.get ["sound-play"] in
  let sound_file = Res.get ["sound"; name ^ ".wav"] in
  let _ =
    Unix.create_process sound_play [| sound_play; sound_file |]
      dev_null dev_null dev_null
  in
  ()

let action =
  begin function
  | `None -> ()
  | `Start -> play "start"
  | `Wall_In -> play "wall-in"
  | `Rock_In -> play "rock-in"
  | `Exit_In -> play "exit-in"
  | `Web_In -> play "web-in"
  | `Web_Out -> play "web-out"
  | `Exit -> play "exit"
  | `No_Exit -> play "no-exit"
  | `Carry_Exit -> play "carry-exit"
  | `Rock_Take -> play "rock-take"
  | `Rock_Drop -> play "rock-drop"
  | `Rock_No_Take -> play "rock-no-take"
  | `Rock_No_Drop -> play "rock-no-drop"
  end
