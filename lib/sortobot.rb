require "mime/types"
require "thor"
require "thor/group"
require "fileutils"
require "sortobot/helper"

module Sortobot
	class Cli < Thor
		desc "push", "push files into directories"
		desc "trim", "removes empty directories"

		def push
			Helper.makedir
			Helper.move
			Helper.trim			
		end

		
		def trim
			Helper.trim
		end
  end
end
