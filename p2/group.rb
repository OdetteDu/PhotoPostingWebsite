module Enumerable
	def each_group_by_first_char
		dict = {}
		self.each do |s|
			c = s[0,1]
			arr = dict[c]
			if arr == nil then
				dict[c] = [s]
			else
				arr << s
				dict[c] = arr
			end
		end

		dict.each do |k, v|
			yield(k,v)
		end
	end
end

puts "Positive Test\n"
x = ["abcd", "axyz", "able", "xyzab", "qrst"]
x.each_group_by_first_char do |char, words|
	printf("%s: %s\n", char, words.join(" "));
end

puts "Test space and empty string\n"
x = ["abcd", " axyz", "able", "axyzab", "aqrst", ""]
x.each_group_by_first_char do |char, words|
	printf("%s: %s\n", char, words.join(" "));
end

puts "Test * and #\n"
x = ["*abcd", "#axyz", " able", "6axyzab", " aqrst", "*#*", "#*#"]
x.each_group_by_first_char do |char, words|
	printf("%s: %s\n", char, words.join(" "));
end

puts "Test escaping characters\n"
x = ["\n*abcd", "\t#axyz", "\nable", "6axyzab", "6aqrst", "*#*", "#*#"]
x.each_group_by_first_char do |char, words|
	printf("%s: %s\n", char, words.join(" "));
end