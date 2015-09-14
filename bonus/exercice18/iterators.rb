
#------ PLAY WITH YELDING TO BLOCKS -------
# 1)
def conversation
	puts "Hello"
	yield
	puts "Goodbye"
end

puts "\nExercice 1\n"
conversation { puts "Godd to meet you!" }	


# ------------------------------------------
# 2)
def five_times_linear_approach
	yield 1
	yield 2
	yield 3
	yield 4
	yield 5
end

def five_times
	1.upto(5) { |n| yield n }
end

puts "\nExercice 2\n"
five_times do |n|
	puts "#{n} situps"
	puts "#{n} pushups"
	puts "#{n} chinups"
end


# ------------------------------------------
# 3)

def n_times(number)
	1.upto(number) { |n| yield n }
end

puts "\nExercice 3\n"
n_times(2) do |n|
	puts "#{n} situps"
	puts "#{n} pushups"
	puts "#{n} chinups"
end


# ------------------------------------------
# Extra - Playing more with yielding blocks

def print_n_and_n_plus1(n)
	puts "#{n} and #{n+1}"
end

def loop_n_times(n)
	1.upto(n) { |n| yield n }
end

puts "\nExercice 4 - Extra\n"
loop_n_times(4) do |n|
	print_n_and_n_plus1(n)
end

