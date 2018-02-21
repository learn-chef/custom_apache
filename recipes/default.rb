#
# Cookbook Name:: custom_apache
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Load from node attributes some variables we'll need.
site_name = node['site']['name']
content_owner = node['site']['content']['owner']
content_group = node['site']['content']['group']

# Ensure the apt cache is up-to-date.
apt_update 'Update the apt cache daily' do
  frequency 86_400
  action :periodic
end

# Install additional Apache packages.
package %w( libapache2-modsecurity libapache2-mod-spamhaus )

# Create the group that owns web content.
group content_group do
  action :create
end

# Create the user that owns web content.
user content_owner do
  group content_group
  home "/home/#{content_owner}"
  shell '/bin/bash'
  manage_home true
  non_unique false
end

# Use the custom site resource to configure the website.
custom_apache_site site_name do
  homepage '<h1>Hello world!</h1>'
end

# Configure the homepage owner.
file '/var/www/html/index.html' do
  owner content_owner
  group content_group
  mode 0644
end

# Configure the web content directory owner.
directory '/var/www/html' do
  owner content_owner
  group content_group
  mode 0755
end
