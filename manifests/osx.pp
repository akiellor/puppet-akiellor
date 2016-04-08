class akiellor::osx {
  class { 'osx::dock::position':
    position => 'right'
  }

  class { 'osx::global::key_repeat_rate':
    rate => 0
  }

  class { 'osx::global::key_repeat_delay':
    delay => 20
  }

  class { 'osx::dock::icon_size':
    size => 24
  }

  include osx::keyboard::capslock_to_control

  boxen::osx_defaults { 'Make function keys do real things, and not apple things':
    user   => $::boxen_user,
    key    => 'com.apple.keyboard.fnState',
    domain => 'NSGlobalDomain',
    value  => 'true',
  }

  boxen::osx_defaults { 'Make tab key do real things, and not apple things':
    user   => $::boxen_user,
    key => 'AppleKeyboardUIMode',
    domain => 'NSGlobalDomain',
    value => '2',
  }
}
