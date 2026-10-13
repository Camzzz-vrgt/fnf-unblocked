#!/usr/bin/env python3
"""Static server for FNF Unblocked.

`python -m http.server` works but its listen backlog is 5 and it speaks
HTTP/1.0 — a game firing 300+ asset requests at once overflows the accept
queue, the OS drops connections (ERR_CONNECTION_REFUSED), and OpenFL
pre-loaders stall forever on a black screen. This wraps the same handler
with a real backlog and HTTP/1.1 keep-alive so sockets get reused.
"""
import sys
import http.server
import socketserver


class Handler(http.server.SimpleHTTPRequestHandler):
    protocol_version = "HTTP/1.1"

    def end_headers(self):
        # html/js/json must always revalidate — cached copies of site JS
        # otherwise keep running old code (stale bgm/nav behaviour)
        if self.path.endswith((".html", ".js", ".json", ".css")) or "." not in self.path.rsplit("/", 1)[-1]:
            self.send_header("Cache-Control", "no-cache")
        super().end_headers()

    def log_message(self, fmt, *args):
        pass


class Server(socketserver.ThreadingTCPServer):
    daemon_threads = True
    allow_reuse_address = True
    request_queue_size = 256


if __name__ == "__main__":
    port = int(sys.argv[1]) if len(sys.argv) > 1 else 8642
    with Server(("127.0.0.1", port), Handler) as srv:
        print(f"serving on http://127.0.0.1:{port}/  (Ctrl+C to stop)")
        srv.serve_forever()
