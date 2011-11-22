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

    package { "ntp": ensure => installed }

    file { "/etc/ntp.conf":
        mode    => "644",
        content => template("ntp/client-ntp.conf.erb"),
        notify  => Service["ntpd"],
        require => Package["ntp"],
    } # file

    $ntpd = $operatingsystem ? {
        CentOS                => 'ntpd',
        Debian                => 'ntp',
        default               =>  undef,
    }

    service { $ntpd:
        alias  => "ntpd",
        ensure  => running,
        enable  => true,
        hasrestart      => true,
        hasstatus       => true,
        require => Package["ntp"],
    } # service
} # class ntp
