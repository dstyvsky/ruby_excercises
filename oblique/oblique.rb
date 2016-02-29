square = []
oblique = []
count = 0

File.open("input.txt", "r") do |f|
	f.each_line do |line|
		square << line
	end
end
		
square.each do |line|
	line_array = line.split
	line_array.each_with_index do |num, index|
		unless oblique[index+count].nil?
			oblique[index + count].push num
		else
			oblique.push [num]
		end
	end
	count += 1
end

oblique.each_with_index do |line, index|
	oblique[index] = line.join(' ')
end


File.open("output.txt", 'w+') do |f|
	oblique.each do |line|
		f.puts(line)
	end	
end



