[Unit]
Description=Supervisor daemon

[Service]
Type=forking
ExecStart=/bin/supervisord -c {{ supervisord_config_dir }}/supervisord.conf
ExecStop=/bin/supervisorctl $OPTIONS shutdown
ExecReload=/bin/supervisorctl $OPTIONS reload
KillMode=process
Restart=on-failure
RestartSec=42s

[Install]
WantedBy=multi-user.target
