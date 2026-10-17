import os
from http.server import BaseHTTPRequestHandler, HTTPServer

NAME = os.getenv("STUDENT_NAME", "Kamilla")
SURNAME = os.getenv("STUDENT_SURNAME", "Bekmukhametova")
GROUP = os.getenv("STUDENT_GROUP", "IT2-2313")
STUDENT_ID = os.getenv("STUDENT_ID", "38239")
PORT = int(os.getenv("APP_PORT", "8000"))

INFO = f"""================================
DevOps Student Application
================================
Name: {NAME}
Surname: {SURNAME}
Group: {GROUP}
Student ID: {STUDENT_ID}
Application is running successfully!
"""


class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-Type", "text/plain; charset=utf-8")
        self.end_headers()
        self.wfile.write(INFO.encode())


if __name__ == "__main__":
    print(INFO, flush=True)
    print(f"Listening on port {PORT}", flush=True)
    HTTPServer(("0.0.0.0", PORT), Handler).serve_forever()
