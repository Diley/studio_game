letters = { 'c' => 2,
			'e' => 1,
			'l' => 1,
			'n' => 1,
			't' => 1,
			'x' => 8,
			'y' => 4
		}

point_totals = Hash.new(0)

puts letters
score = 0
"excellently".each_char { |letter| score += letters[letter]   }
puts "The score for 'excellently' is #{score}"


"excellently".each_char { |letter| point_totals[letter] += letters[letter]}
# calculate score by reducing point_totals
puts "The score for 'excellently' is #{point_totals.values.reduce(:+)}"


