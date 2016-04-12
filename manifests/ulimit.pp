class akiellor::ulimit {
  file { '/Library/LaunchDaemons/limit.maxfiles.plist':
    ensure => present,
    source => "puppet:///modules/akiellor/limit.maxfiles.plist",
  }
}
