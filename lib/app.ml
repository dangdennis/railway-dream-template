let greet who =
  let open Dream_html in
  let open HTML in
  p [ id "greet-%s" who ] [ txt "Hello, %s!" who ]

let get_port () =
  match Sys.getenv_opt "PORT" with
  | Some port_string -> (
      try int_of_string port_string
      with Failure _ ->
        Printf.eprintf "Warning: Invalid PORT value, defaulting to 8080.\n";
        8080)
  | None ->
      Printf.eprintf
        "Warning: PORT environment variable not set, defaulting to 8080.\n";
      8080

let run () =
  Dream.run ~interface:"0.0.0.0" ~port:(get_port ())
  @@ Dream.logger
  @@ Dream.router
       [ Dream.get "/" (fun _ -> Dream_html.respond (greet "World")) ]
