class grow {

  package { 'git':
    ensure => present,
  }
  
  package { 'python-django':
    ensure => present,
  }

  user { 'grow':
    ensure => present,
  }

  python::pip { 'django-bootstrap3':
    pkgname => 'django-bootstrap3',
  }

  vcsrepo { '/opt/grow':
    ensure   => present,
    source   => 'git://github.com/jbussdieker/hydro.git',
    provider => git,
  }

}
