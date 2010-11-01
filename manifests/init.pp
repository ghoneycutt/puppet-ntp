# Class: ntp
#
# This module manages ntp and is standard for all hosts
#
# Requires:
#   $ntpServerList must be set in site manifest
#
# Sample Usage:
#   include ntp
#
class ntp {

    package { "ntp": }

    file { "/etc/ntp.conf":
        mode    => "644",
        content => template("ntp/client-ntp.conf.erb"),
        notify  => Service["ntpd"],
        require => Package["ntp"],
    } # file

    service { "ntpd":
        ensure  => running,
        enable  => true,
        require => Package["ntp"],
    } # service
} # class ntp
