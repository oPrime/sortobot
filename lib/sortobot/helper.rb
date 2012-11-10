require 'fileutils'

module Sortobot
	class Helper
  	Directories = {"text" => "Documents", "image" =>"Images", "audio"=>"Music", "video"=>"Videos"}

		def self.associate(file)
			type = MIME::Types.type_for(file).first.media_type rescue nil
			return Directories[type]
		end

		def self.makedir
			Directories.each_value do |directory|
				FileUtils.mkdir(directory) unless Dir.exists? directory								
			end
		end

		def self.trim
			Dir.foreach(Dir.pwd) do |entry|
				if File.directory? entry
					if Dir.entries(entry).join == "..."
						FileUtils.rmdir entry
					end
				end
			end			
		end

		def self.move
			Dir.foreach(Dir.pwd) do |file|
				if associate(file)
					FileUtils.mv(file, associate(file))		
				end	
			end			
		end
  end  
end