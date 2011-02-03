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

    # the ntp package and service has a different name under RHEL vs. Debian
    case $operatingsystem {
        /(Debian|Ubuntu)/: { 
            $ntp_package = "ntp" 
            $ntp_service = "ntp" 
        }
        /(RedHat|CentOS|Fedora)/: { 
            $ntp_package = "ntp" 
            $ntp_service = "ntpd" 
        }
        default: { 
            $ntp_package = "ntp" 
            $ntp_service = "ntpd" 
        }
    } # case

    package { $ntp_package: }

    file { "/etc/ntp.conf":
        mode    => "644",
        content => template("ntp/client-ntp.conf.erb"),
        notify  => Service[$ntp_service],
        require => Package[$ntp_package],
    } # file

    service { $ntp_service:
        ensure  => running,
        enable  => true,
        require => Package[$ntp_package],
    } # service
} # class ntp
