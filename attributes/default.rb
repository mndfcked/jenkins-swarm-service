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

# Swarm service installation settings
default['jenkinsswarmservice']['install_path'] = 'C:\jenkins-swarm-service'

# Jenkins Swarm client configuration parameter
default['jenkinsswarmservice']['parameters']['auto_discovery_address'] = ''
default['jenkinsswarmservice']['parameters']['disable_ssl_verification'] = ''
default['jenkinsswarmservice']['parameters']['executors'] = ''
default['jenkinsswarmservice']['parameters']['fs_root'] = ''
default['jenkinsswarmservice']['parameters']['labels'] = []
default['jenkinsswarmservice']['parameters']['master'] = ''
default['jenkinsswarmservice']['parameters']['mode'] = ''
default['jenkinsswarmservice']['parameters']['name'] = ''
default['jenkinsswarmservice']['parameters']['password'] = ''
default['jenkinsswarmservice']['parameters']['username'] = ''