[program:{{ item.name }}]
command={{ item.command }}
directory={{ item.directory }}
environment={{ item.environment }}
stderr_logfile={{ item.stderr }}
stdout_logfile={{ item.stdout }}
