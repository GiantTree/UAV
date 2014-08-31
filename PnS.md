Problems and Solutions
======================
PnS is abbreviation of "Problems and Solutions", we will list the problems we met, and the solution we have
in this file.

### Q1. How to make Raspberry Pi connect to WiFi?

edit file /etc/network/interfaces, and insert these lines

use dhcp to get ip address
    auto wlan0
    allow-hotplug wlan0 
    iface wlan0 inet dhcp 
    wpa-ssid "<ap_ssid>" 
    wpa-psk "<ap_password>"

use static ip address for WiFi
    auto wlan0
    wpa-ssid "<ap_ssid>"
    wpa-psk "<ap_password>"
    address "<IP Addr>"
    netmask "255.255.255.0"
    gateway "192.168.1.1"

keyword *auto* is used by command _ifup_ and _ifdown_ with option -a.
use command "/etc/init.d/networking restart" to make the configuration take effect.


### Q2. How to change keyboard layout?

The default keyboard layout in Raspberry is UK-layout, but we should use chinese layout.
Try this command, and choose "Generic KB-101 Model" as the model of our keyboard, choose chinese
layout or US layout for the keyboard, then keep clicking "OK" for the next coming process.
    
    #reconfigure the keyboard layout
    dpkg-reconfigure keyboard-configuration
    #show current layout
    dbconf-show keyboard-configuration

