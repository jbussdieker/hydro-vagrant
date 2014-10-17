class grow {

  package { 'git':
    ensure => present,
  }

  vcsrepo { '/opt/grow':
    ensure   => present,
    source   => 'git://github.com/jbussdieker/hydro.git',
    provider => git,
  }

}
