# wifi

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
