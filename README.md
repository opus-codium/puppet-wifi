# wifi

<!-- header GFM -->
[![Build Status](https://img.shields.io/github/actions/workflow/status/opus-codium/puppet-wifi/release.yml)](https://github.com/opus-codium/puppet-wifi/releases)
[![Puppet Forge](https://img.shields.io/puppetforge/v/opuscodium/wifi.svg)](https://forge.puppetlabs.com/opuscodium/wifi)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/opuscodium/wifi.svg)](https://forge.puppetlabs.com/opuscodium/wifi)
[![Puppet Forge - endorsement](https://img.shields.io/puppetforge/e/opuscodium/wifi.svg)](https://forge.puppetlabs.com/opuscodium/wifi)
[![Puppet Forge - scores](https://img.shields.io/puppetforge/f/opuscodium/wifi.svg)](https://forge.puppetlabs.com/opuscodium/wifi)
[![License](https://img.shields.io/github/license/opus-codium/puppet-wifi.svg)](https://github.com/voxpupuli/opuscodium-wifi/blob/master/LICENSE.md)
<!-- header -->

#### Table of Contents

<!-- vim-markdown-toc GFM -->

* [Module Description](#module-description)
* [Usage](#usage)
  * [Declaring Access Points](#declaring-access-points)

<!-- vim-markdown-toc -->

## Module Description

The wifi module lets you setup your Wi-Fi access points using Puppet.

## Usage

### Declaring Access Points

Each `wifi::infrastructure` declare a different access point:

```puppet
wifi::infrastructure { 'Rocketjump GGGGG':
  psk => '3 words all uppercase',
}

wifi::infrastructure { 'Rocketjump Five Gee':
  psk => 'three words all uppercase',
}

wifi::infrastructure { 'Rocketjump Eff Aiye Vee Ee Gee':
  psk => 'THREEWORDS',
}
```
