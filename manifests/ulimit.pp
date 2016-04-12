class akiellor::ulimit {
  file { '/Library/LaunchDaemons/dev.ulimit.plist':
    ensure => present,
    owner  => "root",
    source => "puppet:///modules/akiellor/dev.ulimit.plist",
  }

  service { 'ulimit':
    enable => true
  }
}
