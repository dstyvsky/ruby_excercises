require 'pry'

hats = []
white = 0
guesser_sees = []
prevoius_guesser_sees = []
pwhite = 0

File.open('input3.txt', 'r') do |f|
	f.each_line do |line|
		line.chomp == "White" ? hats << 0 : hats << 1
	end
end

eyesight = hats.length - 1
first = true
hats.each do |guess|

	if first == false
		previous_sight_range = ( hats.length - (eyesight+1))
		previous_guesser_sees = hats[previous_sight_range..-1]
		previous_guesser_sees.each do |bin|
			pwhite += 1 if bin == 0
		end
	end
	
	sight_range = ( hats.length - eyesight)
	guesser_sees = hats[sight_range..-1]

	eyesight = eyesight - 1
	
	guesser_sees.each do |bin|
		white += 1 if bin == 0
	end

	

	if (white.even? and pwhite.even?) or (white.odd? and pwhite.odd?)
		puts "Black"
	else
		puts "White"
	end

	white = 0
	pwhite = 0
	first = false
end

