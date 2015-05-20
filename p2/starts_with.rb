def each_starts_with(arr, s)
	arr.each do |a|
		if a[0,s.size]==s then
			yield(a)
		end
	end
end

puts 'Test1: '
each_starts_with(["abcd", "axyz", "able", "xyzab", "qrst"], "ab") {|s| puts s}
puts 'Test2: '
each_starts_with(["abcd", "axyz", "able", "xyzab", "qrst"], "") {|s| puts s}
puts 'Test3: ' # test the case where arr[0].size < s.size
each_starts_with(["abcd", "axyz", "able", "xyzab", "qrst"], "abcde") {|s| puts s}
puts 'Test4: ' 
each_starts_with(["abcd", "axyz", "able", "xyzab", "qrst", " ab", "", " abc"], "ab") {|s| puts s}




