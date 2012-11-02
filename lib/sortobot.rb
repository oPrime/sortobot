require "mime/types"
require "thor"


module Sortobot
	class Cli < Thor
		desc "push", "push files into directories"
		def push
		end

  class Root < Thor  	
  	register Sortobot::Cli, 'push', 'push', 'Delegates to a sub-command'
  end
end
