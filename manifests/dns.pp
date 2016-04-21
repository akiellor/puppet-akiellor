class akiellor::dns {
  include dnsmasq

  file { ['/etc/resolver/docker',
          '/etc/resolver/local',
          "${dnsmasq::searchdir}/docker.conf",
          '/Library/LaunchDaemons/dev.docker-dns.plist',
          '/Library/LaunchDaemons/dev.dockerdns.plist']:
    ensure => absent
  }

  boxen::env_script { 're-dns':
    content => "# empty"
  }
}
