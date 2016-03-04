hats = []
white = 0
guesser_sees = []
pwhite = 0

File.open('input2.txt', 'r') do |f|
	f.each_line do |line|
		line.chomp == "White" ? hats << 0 : hats << 1
	end
end

eyesight = hats.length - 1

hats.each do |guess|
	sight_range = ( hats.length - eyesight)
	guesser_sees = hats[sight_range..-1]
	eyesight -= 1

	guesser_sees.each do |bin|
		white += 1 if bin == 0
	end
	
	if (white.even? and pwhite.even?) or (white.odd? and pwhite.odd?)
		puts "Black"
	else
		puts "White"
	end

	white.even? ? pwhite = 0 : pwhite = 1
	white = 0
end

