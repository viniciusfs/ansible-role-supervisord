;
; {{ ansible_managed }}
;

[unix_http_server]
file={{ supervisord_socket_file }}
username={{ supervisord_user }}
password={{ supervisord_password }}

[inet_http_server]
port={{ supervisord_bind_address }}:{{ supervisord_http_port }}

[supervisord]
logfile={{ supervisord_logfile }}
logfile_maxbytes=0
loglevel={{ supervisord_loglevel }}
pidfile=/var/run/supervisord.pid
user=supervisord

[rpcinterface:supervisor]
supervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface

[supervisorctl]
serverurl=unix://{{ supervisord_socket_file }}
username={{ supervisord_user }}
password={{ supervisord_password }}

[include]
files = supervisord.d/*.ini
