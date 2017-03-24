require "bbs/engine"

module Bbs
  # Your code goes here...
  Gem.loaded_specs['bbs'].dependencies.each do |d|
	  require d.name
	end
end
