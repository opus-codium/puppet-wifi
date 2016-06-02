require 'facter'

Facter.add(:networkmanagerversion) do
  confine :lsbdistid => 'Debian'
  setcode "NetworkManager --version"
end
