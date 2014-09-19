#
# Author:: Jörn Domnik (<mail@joerndomnik.de>)
# Cookbook Name:: jenkins-swarm-service
# Recipe:: default
#
# Copyright:: Copyright (c) 2014 Jörn Domnik.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# include Windows::Helper from Opscode Windows Cookbook
::Chef::Recipe.send(:include, Windows::Helper)
::Chef::Recipe.send(:include, JenkinsSwarmService::Helper)

service_is_installed = is_installed?()

setup_zip = ::File.basename("jenkins-swarm-service.zip")
setup_zip_basename = ::File.basename(setup_zip, ".zip");
setup_zip_temp_path = win_friendly_path(File.join(Dir.tmpdir(), setup_zip_basename))
swarm_install_path = win_friendly_path(File.join("#{ENV['systemdrive']}", setup_zip_basename))
swarm_config_file = win_friendly_path(File.join("config", "wrapper.confg"))
setup_log_path = win_friendly_path(File.join(Dir.tmpdir(), "#{setup_zip}.log"))
service_install_batch_file = win_friendly_path(File.join(swarm_install_path, "bat", "installService.bat"))

cookbook_file setup_zip_temp_path do
	source setup_zip
	mode "0644"
	not_if { service_is_installed }
end

windows_zipfile swarm_install_path do
	source setup_zip_temp_path
	action :unzip
	not_if { service_is_installed }
end

template "swarm_config_file" do
	:auto_discovery_addressnode => node['jenkinsswarmservice']['parameters']['auto_discovery_address']
	:disable_ssl_verification => node['jenkinsswarmservice']['parameters']['disable_ssl_verification']
	:executors => node['jenkinsswarmservice']['parameters']['executors']
	:fs_root => node['jenkinsswarmservice']['parameters']['fs_root']
	:labels => node['jenkinsswarmservice']['parameters']['labels']
	:master => node['jenkinsswarmservice']['parameters']['master']
	:mode => node['jenkinsswarmservice']['parameters']['mode']
	:name => node['jenkinsswarmservice']['parameters']['name']
	:password => node['jenkinsswarmservice']['parameters']['password']
	:username => node['jenkinsswarmservice']['parameters']['username']
end

execute "Install service" do 
	command service_install_batch_file
	creates setup_log_path
	not_if { service_is_installed }
end