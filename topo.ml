let starts_with s p =
    let pl = String.length p in
    pl <= String.length s && String.sub s 0 pl = p

let split s d skip_after_d =
    let p = String.index s d in
    let start = p + 1 + skip_after_d in
    let remaining = String.length s - start in
    String.sub s 0 p, String.sub s start remaining

type element =
| Router
| Peer
| Provider

let rec next_line () =
    try
        let s = String.trim (read_line ()) in
        let l = String.length s in
        let conv start len =
            let both = String.sub s start len in
            let a, b = split both ',' 1 in
            a, int_of_string b in
        if starts_with s "#ROUTER(" then
            Some (Router, conv 8 (l-9))
        else if starts_with s "#PEER(" then
            Some (Peer, conv 6 (l-7))
        else if starts_with s "#PROVIDER(" then
            Some (Provider, conv 10 (l-11))
        else
            (* maybe the next one? *)
            next_line ()
    with End_of_file ->
        None

let () =
    let both = Array.length Sys.argv = 2 && Sys.argv.(1) = "--both" in
    let rec f subject =
        let arrow d =
            print_endline (subject ^ " -> " ^ d) in
        match next_line () with
        | None ->
            (* nothing left *)
            ()
        | Some (Router, (router, _)) ->
            f router
        | Some (Peer, (peer, _)) ->
            (* TODO check whether peering has been configured on both sides *)
            if both then
                arrow peer
            else if subject < peer then
                arrow (peer ^ " [arrowhead=none]");
            f subject
        | Some (Provider, (prov, _)) ->
            arrow prov;
            f subject in
    print_endline "digraph {";
    (* FIXME should be None but its handling would be redundant, no? *)
    f "";
    print_endline "}"
