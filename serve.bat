@echo off
cd /d "%~dp0"
start "" http://127.0.0.1:8642/
python serve.py 8642
