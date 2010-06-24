# Class: ntp::server
#
# This module manages ntp servers
#
# Requires: 
#   class ntp
#   $ntp_sources be set in site manifest
#   $ntp_peers be set in site manifest
#
# Sample Usage: include ntp::server
#
class ntp::server inherits ntp {
    File["/etc/ntp.conf"] {
        content => template("ntp/server-ntp.conf.erb"),
    }
} # class ntp::server
