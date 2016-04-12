class akiellor::dns {
  include dnsmasq

  boxen::env_script { 're-dns':
    content => "alias re-dns='echo \"address=/docker/$(docker-machine ip default)\" | sudo tee ${dnsmasq::searchdir}/docker.conf && sudo launchctl stop dev.dnsmasq && sudo launchctl start dev.dnsmasq\'"
  }
}
