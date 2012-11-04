require "mime/types"
require "thor"
require "thor/group"
require "fileutils"
require "sortobot/helper"

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
end
