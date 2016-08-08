#
# Cookbook Name:: dev_webserver
# Recipe:: default
#
# Copyright (c) 2016 Sam Abiodun, All Rights Reserved.
#


include_recipe 'apt::default'
include_recipe 'dev_webserver::firewall'
include_recipe 'dev_webserver::web_user'
include_recipe 'dev_webserver::web'


