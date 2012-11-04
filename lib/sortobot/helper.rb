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
				unless Dir.exists? directory
					FileUtils.mkdir(directory)
				end				
			end
		end
  end  
end