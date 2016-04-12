class akiellor::dns {
  include dnsmasq

  file { '/etc/resolver/docker':
    ensure => present,
    content => "nameserver 127.0.0.1"
  }

  boxen::env_script { 're-dns':
    content => "alias re-dns='echo \"address=/docker/$(docker-machine ip default)\" | sudo tee ${dnsmasq::searchdir}/docker.conf && sudo launchctl stop dev.dnsmasq && sudo launchctl start dev.dnsmasq\'"
  }
}
