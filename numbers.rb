#!/usr/bin/env ruby
print "Enter the number of rounds: "


start = Time.now
total_turns = gets.to_i
current_turn = 0
correct = 0
wrong = 0

while current_turn < total_turns
	current_turn += 1

	x = Random.rand(4)
	y = Random.rand(144)

	print "#{x} + #{y } = "
	answer = gets.to_i 

	if answer == x + y 
		puts "Right!"
		correct += 1
	else 
		puts "Wrong :("
		wrong += 1
	end

end

score = (correct.to_f/total_turns*100).round(2)

puts "Rights #{correct}; Wrongs #{wrong}; Score #{score}%"

duration = (Time.now - start).round(2)

puts "Total time #{duration} seconds"
puts "#{duration/total_turns} seconds per problem"

print "What is your name? "
name = gets.chomp.downcase.capitalize

filename = "scores.txt"
File.open(filename, 'a') do |file|
	file.write("#{name}, #{score}%\n")
end

File.open(filename, 'r') do |file|
	scores = []
	while entry = file.gets
		scores << entry.split(", ")
		
	end
	 test = scores.map { |item| [item[0],item[1].to_f] }
	 second_test = test.sort_by! {|i| i[1]}.reverse.take(5)
	 third_test = second_test.map { |item| item.join(", ")}
	 puts third_test
end



