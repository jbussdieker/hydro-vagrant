class grow {

  package { 'git':
    ensure => present,
  }
->  
  package { 'python-django':
    ensure => present,
  }
->
  group { 'grow':
    ensure => present,
    gid    => 1234,
  }
->
  user { 'grow':
    ensure => present,
    uid    => 1234,
  }
->
  file { '/var/log/grow':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }
->
  file { '/etc/sudoers.d/grow':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
    content => "grow ALL=(ALL) NOPASSWD: ALL\n",
  }
->
  python::pip { 'django-bootstrap3':
    pkgname => 'django-bootstrap3',
  }
->
  vcsrepo { '/opt/grow':
    ensure   => present,
    source   => 'git://github.com/jbussdieker/hydro.git',
    provider => git,
  }
->
  file { '/opt/grow/hydro/db/development.db':
    source => 'puppet:///modules/grow/development.db',
    before => Uwsgi::Manage_app['hydro'],
  }
->
  cron { 'grow_logger':
    command => '/opt/grow/bin/logger.sh /var/log/grow',
  }

}
