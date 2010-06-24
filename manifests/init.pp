# Class: ntp
#
# This module manages ntp and is standard for all hosts
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage: include ntp
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
