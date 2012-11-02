require "mime/types"
require "thor"
require "fileutils"

module Sortobot
	class Cli < Thor
		Directories = {"text" => "Documents", "image" =>"Images", "audio"=>"Music"}
		
		def self.associate(file)
			type = MIME::Types.type_for(file).first

			if type
				if Directories.has_key? type.media_type					
					return Directories[type.media_type]
				end
			end	
		end

		def self.makedir
			Directories.each_value do |directory|
				unless Dir.exists? directory
					FileUtils.mkdir(directory)
				end				
			end
		end

		desc "push", "push files into directories"
		def push
			Cli.makedir
			Dir.open(Dir.pwd).each do |file|
				if Cli.associate(file)
					FileUtils.mv(file, Cli.associate(file))		
				end	
			end			
		end
  end

  class Root < Thor  	
  	register Sortobot::Cli, 'push', 'push', 'Delegates to a sub-command'
  end
end
