class people::tjmcs {
  include caffeine
  include divvy
  include dropbox
  include flux
  include java
  include mou
  include notational_velocity::nvalt
  include rubymine
  include onepassword
  include skype
  include sublime_text_2
  include vagrant

  class { 'intellij':
    edition => 'ultimate',
  }

  ruby::version { 'jruby-1.7.5': }

  vagrant::plugin { 'vagrant-vmware-fusion':
    license => 'puppet:///modules/people/tjmcs/vagrant-vmware-fusion.lic',
  }

  $home     = "/Users/${::luser}"
  $src      = "${home}/src/"
  $cust     = "${src}/cust"
  $dotfiles = "${cust}/dot"

  file { $cust:
    ensure => directory,
  }

  #repository { $dotfiles:
  #  source  => 'tjmcs/dotfiles',
  #}

  # homebrew::tap example.
  #define homebrew::tap (
  #  $ensure = present,
  #) {
  #  if $ensure == 'present' {
  #    exec { "homebrew_tap_${name}":
  #      command => "brew tap ${name}",
  #      unless  => "brew tap | grep ${name}",
  #    }
  #  } else {
  #    exec { "homebrew_untap_${name}":
  #      command => "brew untap ${name}",
  #      onlyif  => "brew tap | grep ${name}",
  #    }
  #  }
  #}

  #homebrew::tap { 'homebrew/games': }

  #package { 'homebrew/games/nethack':
  #  ensure  => present,
  #  require => Homebrew::Tap['homebrew/games'],
  #}

  package {
    [
      'keychain',
      'pstree',
      'tmux',
      'tree',
    ]:
      ensure => installed,
  }

  include 'people::tjmcs::plists'
}
