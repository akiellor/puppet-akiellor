class akiellor::dns {
  include dnsmasq

  file { ['/etc/resolver/docker',
          '/etc/resolver/local',
          "${dnsmasq::searchdir}/docker.conf",
          '/Library/LaunchDaemons/dev.docker-dns.plist']:
    ensure => absent
  }


  file { '/Library/LaunchDaemons/dev.dockerdns.plist':
    ensure => present,
    owner  => "root",
    source => "puppet:///modules/akiellor/dev.docker-dns.plist",
  } -> service { 'dev.dockerdns':
    ensure => running,
    enable => true
  }

  boxen::env_script { 're-dns':
    content => "alias re-dns='sudo launchctl stop dev.dockerdns && sudo launchctl start dev.dockerdns\'"
  }
}
