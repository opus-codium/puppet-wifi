define wifi::infrastructure(
  $psk = undef,
  $uuid = undef,
  $mac = undef,
  $ensure = 'present',
  $ssid = $name,
) {
  if $uuid {
    $real_uuid = $uuid
  } else {
    $real_uuid = sha1($title)
  }
  if $::osfamily == 'FreeBSD' {
    concat::fragment { "/etc/wpa_supplicant.conf-${name}":
      ensure  => $ensure,
      target  => '/etc/wpa_supplicant.conf',
      content => template('wifi/wpa_supplicant.conf'),
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
