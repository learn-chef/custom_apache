# # encoding: utf-8

# Inspec test for recipe custom_apache::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

%w( libapache2-modsecurity libapache2-mod-spamhaus ).each do |package_name|
  describe package(package_name) do
    it { should be_installed }
  end
end

describe group('www-content') do
  it { should exist }
end

describe user('alice') do
  it { should exist }
  its('group') { should eq 'www-content' }
  its('home') { should eq '/home/alice' }
  its('shell') { should eq '/bin/bash' }
end

describe package('apache2') do
  it { should be_installed }
end

describe service('apache2') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/var/www/html/index.html') do
  it { should be_file }
  it { should be_owned_by 'alice' }
  it { should be_grouped_into 'www-content' }
  its('mode') { should cmp '0644' }
end

describe file('/var/www/html') do
  it { should be_directory }
  it { should be_owned_by 'alice' }
  it { should be_grouped_into 'www-content' }
  its('mode') { should cmp '0755' }
end

describe port(80) do
  it { should be_listening }
end
