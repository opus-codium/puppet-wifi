# frozen_string_literal: true

require 'spec_helper'

describe 'wifi::infrastructure' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:title) { 'Rocketjump5G' }

      let(:facts) { facts }

      let(:params) do
        {
          'psk' => psk,
          'bssid' => '11:22:33:44:55:66',
        }
      end

      let(:psk) { 'fourwordsalluppercase' }

      case facts[:os]['family']
      when 'Debian'
        it { is_expected.to contain_file('/etc/NetworkManager/system-connections/Rocketjump5G').with(content: %r{psk=69a009878c8c09d5afa07e4572bd7eeb3b3d9cb1cae4755cc1dca38ad881f972}) }
        it { is_expected.to contain_file('/etc/NetworkManager/system-connections/Rocketjump5G').with(content: %r{bssid=11:22:33:44:55:66}) }
      when 'FreeBSD'
        it { is_expected.to contain_concat__fragment('/etc/wpa_supplicant.conf-Rocketjump5G').with(content: %r{psk=69a009878c8c09d5afa07e4572bd7eeb3b3d9cb1cae4755cc1dca38ad881f972}) }
        it { is_expected.to contain_concat__fragment('/etc/wpa_supplicant.conf-Rocketjump5G').with(content: %r{bssid=11:22:33:44:55:66}) }
      end

      context 'with a hashed psk' do
        let(:psk) { '69a009878c8c09d5afa07e4572bd7eeb3b3d9cb1cae4755cc1dca38ad881f972' }

        case facts[:os]['family']
        when 'Debian'
          it { is_expected.to contain_file('/etc/NetworkManager/system-connections/Rocketjump5G').with(content: %r{psk=69a009878c8c09d5afa07e4572bd7eeb3b3d9cb1cae4755cc1dca38ad881f972}) }
        when 'FreeBSD'
          it { is_expected.to contain_concat__fragment('/etc/wpa_supplicant.conf-Rocketjump5G').with(content: %r{psk=69a009878c8c09d5afa07e4572bd7eeb3b3d9cb1cae4755cc1dca38ad881f972}) }
        end
      end
    end
  end
end
