;
; {{ ansible_managed }}
;

[unix_http_server]
file=/var/run/supervisord.sock
username={{ supervisord_user }}
password={{ supervisord_password }}

[inet_http_server]
port={{ supervisord_bind_address }}:{{ supervisord_http_port }}

[supervisord]
logfile={{ supervisord_log_dir }}/supervisord.log
logfile_maxbytes=0
loglevel={{ supervisord_log_level }}
pidfile=/var/run/supervisord.pid

[rpcinterface:supervisor]
supervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface

[supervisorctl]
serverurl=unix:///var/run/supervisord.sock
username={{ supervisord_user }}
password={{ supervisord_password }}

[include]
files = {{ supervisord_config_dir }}/conf.d/*.ini
