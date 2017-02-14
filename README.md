# Ansible role: Supervisor


[![Build Status](https://travis-ci.org/viniciusfs/ansible-role-supervisord.svg?branch=master)](https://travis-ci.org/viniciusfs/ansible-role-supervisord)

Installs and configures Supervisor in CentOS/RHEL systems.


## Role variables

* `supervisord_user`:
    - Description: Username for supervisord system and HTTP user
    - Default: `supervisord`

* `supervisord_password`:
    - Description: Password for HTTP user
    - Default: `master`

* `supervisord_user_group`:
    - Description: Group name for supervisord user group
    - Default: `supervisord`

* `supervisord_config_dir`
    - Description: supervisord configuration direcotry
    - Default: `/etc/supervisor`

* `supervisord_log_dir`:
    - Description: supervisord log directory
    - Default: `/var/log/supervisord`

* `supervisord_log_level`:
    - Description: supervisord log level
    - Default: `info`

* `supervisord_bind_address`:
    - Description: supervisord ip addess to bind
    - Default: `0.0.0.0`

* `supervisord_http_port`:
    - Description: inet http server port port
    - Default: `9001`


## Example Playbook

    - hosts: servers
      roles:
        - { role: viniciusfs.supervisord }


## License

MIT


## Author Information

* Vinícius Figueiredo <viniciusfs@gmail.com>
