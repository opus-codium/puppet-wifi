# frozen_string_literal: true

require 'openssl'

# @summary Generate the 256-bit pre-shared WPA key for a Wi-Fi network
Puppet::Functions.create_function(:'wifi::wpa_passphrase') do
  # @param ssid SSID of the network
  # @param passphrase Passphrase used for authentication on the network
  # @return [String] The hashed passphrase
  dispatch :wpa_passphrase do
    param 'String', :ssid
    param 'String[8,63]', :passphrase
    return_type 'String'
  end

  dispatch :undef_wpa_passphrase do
    param 'String', :ssid
    param 'Undef', :passphrase
    return_type 'Undef'
  end

  def wpa_passphrase(ssid, passphrase)
    OpenSSL::PKCS5.pbkdf2_hmac_sha1(passphrase, ssid, 4096, 32).unpack1('H*')
  end

  def undef_wpa_passphrase(_ssid, _passphrase)
    :undef
  end
end
