# @summary Manage Wi-Fi configuration
class wifi {
  if $facts.get('os.family') == 'FreeBSD' {
    concat { '/etc/wpa_supplicant.conf':
      ensure => present,
      owner  => 'root',
      group  => 'wheel',
      mode   => '0600',
    }

    concat::fragment { 'wpa_supplicant general':
      target  => '/etc/wpa_supplicant.conf',
      content => @(HEADER),
        ctrl_interface=/var/run/wpa_supplicant
        eapol_version=2
        ap_scan=1
        fast_reauth=1

        | HEADER
      order   => '01',
    }
  }
}
