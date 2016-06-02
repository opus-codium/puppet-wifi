define wifi::infrastructure(
  $mac,
  $psk,
  $uuid,
  $ensure = 'present',
  $ssid = $name,
) {
  if $::osfamily == 'FreeBSD' {
    concat::fragment { "/etc/wpa_supplicant.conf-${name}":
      ensure  => $ensure,
      target  => '/etc/wpa_supplicant.conf',
      content => "network={\n  ssid=\"${ssid}\"\n  psk=\"${psk}\"\n}\n",
      order   => '10',
    }
  }
  if ($::osfamily == 'Debian' and $::networkmanagerversion) {
    file { "/etc/NetworkManager/system-connections/${ssid}":
      ensure  => $ensure,
      owner   => 0,
      group   => 0,
      mode    => '0600',
      content => template('wifi/NetworkManagerConnection.erb'),
    }
  }
}
