name             'jenkins-swarm-service'
maintainer       'Jörn Domnik'
maintainer_email 'mail@joerndomnik.de'
license          'Apache 2'
description      'Installs the Jenkins Swarm plugin client as Service'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
ver_path = File.join(File.dirname(__FILE__), 'version.txt')
version ((IO.read(ver_path) if File.exists?(ver_path)) || '0.1.0').chomp
supports         'windows'
depends          'windows', '>= 1.34.1'
