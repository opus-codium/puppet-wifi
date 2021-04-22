# @summary This define configure a Wi-Fi connection to a network
#
# @param dns DNS servers to use with this connection
# @param mac MAC address of the Access Point
# @param psk Pre-Shared Key to use for authentication
# @param ssid Service Set IDentifier (SSID) of the network
# @param uuid UUID of the network
# @param priority Priority of this AP
define wifi::infrastructure (
  Enum['present', 'absent'] $ensure   = 'present',
  Array[String]             $dns      = [],
  Optional[String]          $mac      = undef,
  Optional[String[8,64]]    $psk      = undef,
  Optional[String]          $ssid     = $name,
  Optional[String]          $uuid     = undef,
  Optional[Integer]         $priority = undef,
) {
  include wifi

  if 64 == $psk.length() {
    $real_psk = $psk
  } else {
    $real_psk = wifi::wpa_passphrase($ssid, $psk)
  }

  case $facts.get('os.family') {
    'debian': {
      if $uuid {
        $real_uuid = $uuid
      } else {
        $real_uuid = sha1($title)
      }

      file { "/etc/NetworkManager/system-connections/${ssid}":
        ensure  => $ensure,
        owner   => 0,
        group   => 0,
        mode    => '0600',
        content => epp('wifi/NetworkManagerConnection.epp',
          {
            dns       => $dns,
            mac       => $mac,
            real_psk  => $real_psk,
            real_uuid => $real_uuid,
            ssid      => $ssid,
          }
        ),
      }
    }
    'freebsd': {
      if  $ensure == 'present' {
        concat::fragment { "/etc/wpa_supplicant.conf-${name}":
          target  => '/etc/wpa_supplicant.conf',
          order   => '10',
          content => epp('wifi/wpa_supplicant.conf.epp',
            {
              ssid     => $ssid,
              real_psk => $real_psk,
              priority => $priority,
            }
          ),
        }
      }
    }
    default: {
      fail('operating system not supported')
    }
  }
}
