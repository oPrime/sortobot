require "mime/types"
require "thor"
require "thor/group"
require "fileutils"

module Sortobot
	class Cli < Thor
		desc "push", "push files into directories"
		def push
			Helper.makedir
			Dir.foreach(Dir.pwd) do |file|
				if Helper.associate(file)
					FileUtils.mv(file, Helper.associate(file))		
				end	
			end			
		end

		desc "trim", "removes empty directories"
		def trim
			Dir.foreach(Dir.pwd) do |entry|
				if File.directory? entry
					if Dir.entries(entry).join == "..."
						FileUtils.rmdir entry
					end
				end
			end
		end
  end

  class Helper
  	Directories = {"text" => "Documents", "image" =>"Images", "audio"=>"Music", "video"=>"Videos"}

		def self.associate(file)
			type = MIME::Types.type_for(file).first.media_type rescue nil
			return Directories[type]
		end

		def self.makedir
			Directories.each_value do |directory|
				unless Dir.exists? directory
					FileUtils.mkdir(directory)
				end				
			end
		end
  end  
end
