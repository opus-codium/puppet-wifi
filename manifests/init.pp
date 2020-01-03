# @summary Manage Wi-Fi configuration
class wifi {
  if $::osfamily == 'FreeBSD' {
    concat { '/etc/wpa_supplicant.conf':
      ensure => present,
      owner  => 'root',
      group  => 'wheel',
      mode   => '0600',
    }

    concat::fragment { 'wpa_supplicant general':
      target  => '/etc/wpa_supplicant.conf',
      content => "ctrl_interface=/var/run/wpa_supplicant\n",
      order   => '01',
    }
  }
}
