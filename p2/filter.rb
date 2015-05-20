def filter(arr, restriction = {})
	for n in arr do
		if restriction[:min] != nil then
			if n < restriction[:min] then
				next
			end
		end

		if restriction[:max] != nil then
			if n > restriction[:max] then
				next
			end
		end

		if restriction[:odd] != nil then
			if n%2 == 1 then
			else
				next
			end
		end

		if restriction[:even] != nil then
			if n%2 == 0 then
			else
				next
			end
		end

		if restriction[:scale] != nil then
			yield(n * restriction[:scale])
		else
			yield(n)
		end
	end
	
end

nums = [6, -5, 319, 400, 18, 94, 11]
puts 'Test 1: '
filter(nums, :min => 10, :max => 350, :odd => 1, :scale => 2) {|n| puts n}
puts 'Test 2: '
filter(nums, :max => 0) {|n| puts n}
puts 'Test 3: '
filter(nums) {|n| puts n}

nums = [-3, -2, -1, 0, 1, 2, 3, 0, 100, 1000]
puts 'Test 4: '
filter(nums, :even => 10, :scale => 0.5, :max => 99) {|n| puts n}

nums = [-3, -2, -1, 0, 1, 2.5, 3.8, 0, 1001, 1000]
puts 'Test 6: '
filter(nums, :odd => 10, :scale => 0.5, :min => -3) {|n| puts n}