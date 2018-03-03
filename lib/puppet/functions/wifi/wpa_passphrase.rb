require 'openssl'

Puppet::Functions.create_function(:'wifi::wpa_passphrase') do
  dispatch :wpa_passphrase do
    param 'String', :ssid
    param 'String', :passphrase
    return_type 'String'
  end

  def wpa_passphrase(ssid, passphrase)
    OpenSSL::PKCS5.pbkdf2_hmac_sha1(passphrase, ssid, 4096, 32).unpack('H*').first
  end
end
