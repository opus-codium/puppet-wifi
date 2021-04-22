require 'spec_helper'

describe 'wifi::infrastructure' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:title) { 'Rocketjump5G' }

      let(:facts) { facts }

      let(:params) do
        {
          'psk' => psk,
        }
      end

      context 'with an ascii psk' do
        let(:psk) { 'fourwordsalluppercase' }

        case facts[:os]['family']
        when 'Debian'
          it { is_expected.to contain_file('/etc/NetworkManager/system-connections/Rocketjump5G').with(content: /psk=69a009878c8c09d5afa07e4572bd7eeb3b3d9cb1cae4755cc1dca38ad881f972/) }
        when 'FreeBSD'
          it { is_expected.to contain_concat__fragment('/etc/wpa_supplicant.conf-Rocketjump5G').with(content: /psk=69a009878c8c09d5afa07e4572bd7eeb3b3d9cb1cae4755cc1dca38ad881f972/) }
        end
      end

      context 'with a hashed psk' do
        let(:psk) { '69a009878c8c09d5afa07e4572bd7eeb3b3d9cb1cae4755cc1dca38ad881f972' }

        case facts[:os]['family']
        when 'Debian'
          it { is_expected.to contain_file('/etc/NetworkManager/system-connections/Rocketjump5G').with(content: /psk=69a009878c8c09d5afa07e4572bd7eeb3b3d9cb1cae4755cc1dca38ad881f972/) }
        when 'FreeBSD'
          it { is_expected.to contain_concat__fragment('/etc/wpa_supplicant.conf-Rocketjump5G').with(content: /psk=69a009878c8c09d5afa07e4572bd7eeb3b3d9cb1cae4755cc1dca38ad881f972/) }
        end
      end
    end
  end
end
