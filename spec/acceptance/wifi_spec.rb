require 'spec_helper_acceptance'

describe 'wifi class' do
  it 'ensure network-manager is installed' do
    pp = <<~MANIFEST
      package { 'network-manager':
        ensure => installed,
      }
    MANIFEST

    apply_manifest(pp, catch_failures: true)
  end

  it 'configures Wi-Fi access points' do
    pp = <<~MANIFEST
      # https://www.youtube.com/watch?v=bLE7zsJk4AI

      wifi::infrastructure { 'Rocketjump GGGGG':
        psk => '4 words all uppercase',
      }

      wifi::infrastructure { 'Rocketjump Five Gee':
        psk => 'four words all uppercase',
      }

      wifi::infrastructure { 'Rocketjump 5 and then the letter G':
        psk => 'FOUR WORDS',
      }

      wifi::infrastructure { 'Rocketjump 5, Gee!':
        psk => '4 WORDS ALL UPPERCASE',
      }

      wifi::infrastructure { 'Rocketjump Eff Aiye Vee Ee Gee':
        psk => 'FOURWORDS',
      }

      wifi::infrastructure { 'Rocket, Jump 5, G':
        psk => 'fourwordsalluppercase',
      }

      wifi::infrastructure { 'The One That Says 5G':
        psk => '4wordsalluppercase',
      }
    MANIFEST

    apply_manifest(pp, catch_failures: true)
    apply_manifest(pp, catch_changes: true)
  end
end
