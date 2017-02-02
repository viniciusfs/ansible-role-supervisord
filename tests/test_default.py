import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    '.molecule/ansible_inventory').get_hosts('all')


def test_pip_package(Package):
    pip = Package('python2-pip')

    assert pip.is_installed


def test_supervisor_package(PipPackage):
    package_list = PipPackage.get_packages(pip_path='/bin/pip')

    assert 'supervisor' in package_list.keys()


def test_supervisord_group(Group):
    supervisord = Group('supervisord')

    assert supervisord.exists


def test_supervisord_user(User):
    supervisord = User('supervisord')

    assert supervisord.exists


def test_directories(File):
    directories = ['/etc/supervisor', '/etc/supervisor/conf.d',
                   '/var/log/supervisord']

    for directory in directories:
        d = File(directory)

        assert d.exists
        assert d.is_directory


def test_config_file(File):
    config = File('/etc/supervisor/supervisord.conf')

    assert config.exists
    assert config.is_file
    assert config.user == 'root'
    assert config.group == 'root'
    assert config.mode == 0644


def test_systemd_script(File):
    systemd = File('/etc/systemd/system/supervisord.service')

    assert systemd.exists
    assert systemd.is_file
    assert systemd.user == 'root'
    assert systemd.group == 'root'
    assert systemd.mode == 0755


def test_supervisor_running_enabled(Service):
    supervisord = Service('supervisord')

    assert supervisord.is_running
    assert supervisord.is_enabled
