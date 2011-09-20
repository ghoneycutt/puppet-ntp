# Class: ntp::server
#
# This module manages ntp servers
#
# Requires: 
#   class ntp
#   $ntp_sources and $ntp_peers passed as parameters to class ntp
#
# Sample Usage:
#   class {
#       "ntp::server":
#           ntp_sources => [ "10.0.0.1" ],
#           ntp_peers   => [ "10.0.0.2" ];
#   }
#
class ntp::server( $ntp_sources, $ntp_peers ) inherits ntp {
    File["/etc/ntp.conf"] {
        content => template("ntp/server-ntp.conf.erb"),
    }
} # class ntp::server
