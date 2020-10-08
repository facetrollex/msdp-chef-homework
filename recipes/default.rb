#
# Cookbook:: msdp-chef
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

file '/tmp/interfaces.txt' do
  content "#{node['network']['interfaces']}"
end

package 'httpd' do
  action :install
end

service 'httpd' do
  action [:start, :enable]
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  mode '0755'
  notifies :restart, 'service[httpd]'
end