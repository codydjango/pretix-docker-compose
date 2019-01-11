import http.server
import socketserver
import os

IP = "0.0.0.0"
PORT = 8000
PUBLIC_DIR = os.path.join(os.path.dirname(__file__), 'public')
Handler = http.server.SimpleHTTPRequestHandler

os.chdir(PUBLIC_DIR)

with socketserver.TCPServer((IP, PORT), Handler) as httpd:
    print("serving %s at %s:%s" % (PUBLIC_DIR, IP, PORT))
    httpd.serve_forever()