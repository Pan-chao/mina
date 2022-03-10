type 'a t

external run_in_thread : (unit -> 'a) -> 'a t = "deferred_run"

let block_on_async_exn (_ : unit -> 'a t) : 'a =
  failwith "You can't block on async execution in JS"

external map : 'a t -> f:('a -> 'b) -> 'b t = "deferred_map"

external bind : 'a t -> f:('a -> 'b t) -> 'b t = "deferred_bind"

external upon : 'a t -> ('a -> unit) -> unit = "deferred_upon"

external is_determined : 'a t -> bool = "deferred_is_determined"

external peek : 'a t -> 'a option = "deferred_peek"

external value_exn : 'a t -> 'a = "deferred_value_exn"

external return : 'a -> 'a t = "deferred_return"

include Base.Monad.Make (struct
  type nonrec 'a t = 'a t

  let map = `Custom map

  let bind = bind

  let return = return
end)
