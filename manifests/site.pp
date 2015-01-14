node 'default' {
  #fail ('Still need to set something up')
  
  vcsrepo { '/root/.dotfiles':
    ensure => present,
    provider => git,
    source => 'https://github.com/pjfoley/dotfiles-home.git',
  }
  
  dotfiles { '/root':
    dotfiles => '/root/.dotfiles',
    owner => 'root',
    group => 'root',
    require => Vcsrepo['/root/.dotfiles'],
  }
}
