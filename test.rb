File.open('animals.txt', 'r') do |file|
  while line = file.gets
    puts line
  end
end