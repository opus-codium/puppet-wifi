class wifi {
  if $::osfamily == 'FreeBSD' {
    concat { '/etc/wpa_supplicant.conf':
      ensure => present,
      owner  => 'root',
      group  => 'wheel',
      mode   => '0600',
    }
  }
}
