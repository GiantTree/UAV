Problems and Solutions
======================
PnS is abbreviation of "Problems and Solutions", we will list the problems we met, and the solution we have
in this file.

### Q1. How to make Raspberry Pi connect to WiFi?

edit file /etc/network/interfaces, and insert these lines

use dhcp to get ip address
    
    allow-hotplug wlan0 
    auto wlan0
    iface wlan0 inet dhcp 
    wpa-ssid "<ap_ssid>" 
    wpa-psk "<ap_password>"

For device which always move from one place to another place, it is really frustrated to modify this
configuration file every time. Fortunately, we got a solution for this case.

    wpa_passphrase <SSID> <PASSWD>
    wpa_passphrase bz_hack zhaorui123 >> /etc/wpa_supplicant/wpa_supplicant.conf

Then modify /etc/network/interface, let RaspberryPi detect and connect the known Wi-Fi automatically.

    allow-hotplug wlan0
    auto wlan0
    iface wlan0 inet dhcp
    pre-up wpa_supplicant -B -D wext -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf
    post-down killall -q wpa_supplicant

use static ip address for WiFi
    
    auto wlan0
    wpa-ssid "<ap_ssid>"
    wpa-psk "<ap_password>"
    address "<IP Addr>"
    netmask "255.255.255.0"
    gateway "192.168.1.1"

keyword *auto* is used by command _ifup_ and _ifdown_ with option -a.
use command "/etc/init.d/networking restart" to make the configuration take effect.
There are  other WiFi commands also very helpful, I will list here.

    #list out all the available AP
    iwlist scan
    #list out all the available channel
    iwlist channel

    #iwconfig iwspy iwevent...
    iwconfig

### Q2. How to change keyboard layout?

The default keyboard layout in Raspberry is UK-layout, but we should use chinese layout.
Try this command, and choose "Generic KB-101 Model" as the model of our keyboard, choose chinese
layout or US layout for the keyboard, then keep clicking "OK" for the next coming process.
    
    #reconfigure the keyboard layout
    dpkg-reconfigure keyboard-configuration
    #show current layout
    dbconf-show keyboard-configuration

