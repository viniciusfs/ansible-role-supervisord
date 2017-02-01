[program:{{ item.name }}]
{% if item.gunicorn_enabled == True %}
command=/opt/muxi/virtualenvs/{{ item.name }}/bin/python /opt/muxi/virtualenvs/{{ item.name }}/bin/gunicorn -b 0.0.0.0:{{ item.gunicorn_port }} {{ item.gunicorn_wsgi }}
{% else %}
command=/opt/muxi/virtualenvs/{{ item.name }}/bin/python /opt/muxi/apps/{{ item.name }}/{{ item.start_script }}
{% endif %}
directory=/opt/muxi/apps/{{ item.name }}
environment=PYTHONPATH=/opt/muxi/apps/{{ item.name }}:/opt/muxi/virtualenvs/{{ item.name }}/lib/python2.7/site-packages
stderr_logfile=/opt/muxi/logs/supervisord/{{ item.name }}.stderr.log
stdout_logfile=/opt/muxi/logs/supervisord/{{ item.name }}.stdout.log
