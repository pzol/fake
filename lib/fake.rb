class Fake < BasicObject

	def initialize
		@hash = {}
	end

	def self.create(args={})
		fake = ::Fake.new
		args.each {|k, v| fake.stub!(k, v) }
		fake
	end

	def stub!(m, v, *args)
		@hash[__key__(m, args)] = v
	end

	def method_missing(m, *args)
		@hash[__key__(m, args)] or raise_no_metho_error(m)
	end

	def inspect
		@hash
	end
	
	private
		def __key__(m, *args)
			[m, *args]
		end

		def raise_no_metho_error(m)
			::Kernel.raise(::NoMethodError, "undefined method '#{m}'")
		end

end

