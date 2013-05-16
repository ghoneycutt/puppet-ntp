# **DEPRECATED** #

## Please use [https://github.com/ghoneycutt/puppet-module-ntp](https://github.com/ghoneycutt/puppet-module-ntp)

<br/>

===
ntp

This is the ntp module which manages ntp clients and servers

# Class: ntp #

This module manages ntp clients and is standard for all hosts

## Requires: ##
  $ntpServerList be set in site manifest

## Sample Usage: ##
  include ntp

# Class: ntp::server #

This module manages ntp servers

## Requires: ##
  class ntp
  $ntp_sources be set in site manifest
  $ntp_peers be set in site manifest

## Sample Usage: ##
  include ntp::server

===

A good starting point for NTP servers is
$ntpServerList = [ '0.pool.ntp.org', '1.pool.ntp.org', '2.pool.ntp.org', '3.pool.ntp.org' ]
