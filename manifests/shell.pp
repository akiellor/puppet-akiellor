class akiellor::shell {
  include iterm2::stable
  include iterm2::colors::solarized_dark

  package { 'bash-completion': }

  boxen::env_script { 'bash-completion':
    content => "[ -f $::homebrew::config::installdir/etc/bash_completion ] && . $::homebrew::config::installdir/etc/bash_completion",
  }
}

