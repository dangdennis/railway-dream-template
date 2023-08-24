let greet who =
  let open Tyxml.Html in
  html
    (head (title (txt "Greeting")) [])
    (body [ h1 [ txt "Good morning, "; txt who; txt "!" ] ])

let html_to_string html = Format.asprintf "%a" (Tyxml.Html.pp ()) html

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
       [ Dream.get "/" (fun _ -> Dream.html (html_to_string (greet "Railway"))) ]
