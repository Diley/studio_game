def say_hello(name, health=100)
	"I'm #{name.capitalize} with a health of #{health} as of #{new_time}"
end

def new_time
	Time.new.strftime("%I:%M;%S");
end

puts say_hello("larry", 60)
puts say_hello("curly", 125)
puts say_hello("moe")
puts say_hello("shemp", 90)

puts new_time

# puts say_hello