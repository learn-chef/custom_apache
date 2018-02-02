name 'custom_apache'
maintainer 'Chef Software, Inc.'
maintainer_email 'training@chef.io'
license 'Apache-2.0'
description 'Installs Apache HTTP Server and manages the service.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.2.0'
supports 'ubuntu'
issues_url 'https://github.com/learn-chef/custom_apache/issues'
source_url 'https://github.com/learn-chef/custom_apache'
chef_version '>= 12.7' if respond_to?(:chef_version)
