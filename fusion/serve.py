"""Dual-stack uvicorn start for fusion, the same pattern AiSOC's other Python
services use (app/scripts/serve.py): the upstream image binds 0.0.0.0 only, and
Railway's private network is IPv6."""
import os
import socket
import sys

port = int(os.environ.get("PORT", "8003"))
sock = socket.socket(socket.AF_INET6, socket.SOCK_STREAM)
sock.setsockopt(socket.IPPROTO_IPV6, socket.IPV6_V6ONLY, 0)
sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
sock.bind(("::", port))
sock.listen(128)
os.set_inheritable(sock.fileno(), True)
os.chdir("/app")
os.execvp(sys.executable, [sys.executable, "-m", "uvicorn", "app.main:app", "--fd", str(sock.fileno())])
