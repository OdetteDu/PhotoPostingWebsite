def funny_sort(arr)
	arr.sort do |a, b|
		aMatch =/[0-9]+/.match(a)
		bMatch =/[0-9]+/.match(b)
		aNum = -1
		bNum = -1
		if aMatch != nil then
			aNum = aMatch.to_s.to_i
		end
		if bMatch != nil then
			bNum = bMatch.to_s.to_i
		end
		# puts 'aNum: '+aNum.to_s
		# puts 'bNum: '+bNum.to_s
		aNum <=> bNum
	end
end

puts "Test1: \n"
puts funny_sort(["abc99.6", "-100x500", "a", "1000", "1.1"])
puts "Test2: \n"
puts funny_sort(["8a;sdkfa;", "^&*((*&kdjf1jfdsa", "0.125"])
puts "Test3: \n"
puts funny_sort(["a11;", "a12", "a13", "0.338", "3.8", "3.1415926"])
puts "Test4: \n"
puts funny_sort(["\ta11;", "\na12", "a13", "sf0.338", "df3.8", "3.daf1415926"])
