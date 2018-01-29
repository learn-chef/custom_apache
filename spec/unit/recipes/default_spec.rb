#
# Cookbook Name:: custom_apache
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'custom_apache::default' do

  context 'When all attributes are default, on an unspecified platform' do

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end

    it 'creates the default web site' do
      expect(chef_run).to create_custom_web_site 'default'
    end

    it 'configures web content ownership' do
      expect(chef_run).to create_file('/var/www/html/index.html').with(
        owner: 'alice',
        group: 'www-content',
        mode: 0640,
      )
      expect(chef_run).to_not create_directory('/var/www/html').with(
        owner: 'alice',
        group: 'www-content',
        mode: 0750,
      )
    end
  end
end
