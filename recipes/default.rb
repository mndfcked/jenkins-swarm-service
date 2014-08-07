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

#version        = node['dotnetframework']['version']
#package_name   = node['dotnetframework'][version]['package_name']
#url            = node['dotnetframework'][version]['url']
#checksum       = node['dotnetframework'][version]['checksum']

# include Windows::Helper from Opscode Windows Cookbook
::Chef::Recipe.send(:include, Windows::Helper)

setup_zip      = ::File.basename("jenkins-swarm-service.zip")
setup_zip_temp_path = win_friendly_path(File.join(Dir.tmpdir(), setup_zip))
swarm_install_path = "c:/jenkins-swarm" 
setup_log_path = win_friendly_path(File.join(Dir.tmpdir(), "#{setup_zip}.html"))
service_install_batch_file = win_friendly_path(File.join(swarm_install_path), "bat/installService.bat")

cookbook_file setup_zip_temp_path do
	source "jenkins-swarm-service.zip"
	mode "0644"
end

windows_zipfile swarm_install_path do
	source setup_zip_temp_path
	action :unzip
end

execute "Install service" do 
	command service_install_batch_file
	creates "e:/logs/service_install.log"
end