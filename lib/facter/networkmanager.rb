# frozen_string_literal: true

require 'facter'

Facter.add(:networkmanagerversion) do
  confine lsbdistid: 'Debian'
  setcode 'NetworkManager --version'
end
