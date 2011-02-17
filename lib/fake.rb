module Fake
	def self.create(args={})
		fake = Fake.new
		args.each {|k, v| fake.stub!(k, v) }
		fake
	end
  
  class Fake < BasicObject

  	def initialize
  		@hash = {}
  	end

  	def stub!(m, v, *args)
  		@hash[__key__(m, args)] = v
  		self
  	end

  	def method_missing(m, *args)
  		@hash[__key__(m, args)] or __raise_no_method_error__(m)
  	end

  	def inspect
  		@hash
  	end
	
  	private
  		def __key__(m, *args)
  			[m, *args]
  		end

  		def __raise_no_method_error__(m)
  			::Kernel.raise(::NoMethodError, "undefined method '#{m}'")
  		end

  end
end