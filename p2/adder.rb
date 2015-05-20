class Adder
	def initialize(x)
		@x = x
	end

	def method_missing(method)
		result = /plus[1-9][0-9]*$/.match(method)
		if result != nil then
			num = method[4,method.size].to_i
			Adder.class_eval "def #{method}
				return @x + #{num}
			end"
			eval method.to_s
		else
			super
		end
	end
end

x = Adder.new(10)
puts x.plus20()
puts x.plus25()
puts x.plus20()
puts x.minus20()
puts x.plus30a()
puts x.plus020()
puts x.plus0()

