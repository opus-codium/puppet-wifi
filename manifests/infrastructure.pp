define wifi::infrastructure(
  Optional[String] $psk = undef,
  Optional[String] $uuid = undef,
  Optional[String] $mac = undef,
  Array[String] $dns = [],
  String $ensure = 'present',
  Optional[String] $ssid = $name,
) {
  include ::wifi

  if $uuid {
    $real_uuid = $uuid
  } else {
    $real_uuid = sha1($title)
  }
  if $::osfamily == 'FreeBSD' and $ensure == 'present' {
    concat::fragment { "/etc/wpa_supplicant.conf-${name}":
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
