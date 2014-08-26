    
module JenkinsSwarmService
	module Helper
		def is_installed?()
			File.exists?(File.join(node['jenkinsswarmservice']['install_path'], 'wrapper.jar'))
		end
	end
end