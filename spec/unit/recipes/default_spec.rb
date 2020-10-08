#
# Cookbook:: msdp-chef
# Spec:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'msdp-chef::default' do
  platform 'centos', '8'
  let(:template) { chef_run.template('/var/www/html/index.html') }

  it { is_expected.to install_package('httpd') }
  it { is_expected.to start_service('httpd') }
  it { is_expected.to create_file('/tmp/interfaces.txt') }
  it { is_expected.to render_file('/var/www/html/index.html').with_content('<h1>Hello, world!</h1>') }
  it { is_expected.to render_file('/var/www/html/index.html').with_content('<h2>ipaddress:') }
  it { is_expected.to render_file('/var/www/html/index.html').with_content('<h2>hostname:') }
  it { is_expected.to create_template('/var/www/html/index.html').with(mode: '0755') }
  it { expect(template).to notify('service[httpd]').to(:restart) }


end
