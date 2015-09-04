# Two Player Math Game
# Players take turns answering addition problems
# Questions auto-generated (1-20)
# Players have 3 lives, lose 1 for wrong answer (output score total)
# Game ends when a player loses all their lives. (output score & winner)
require 'pry'
require 'colorize'

player1_lives = 3
player2_lives = 3
player1_score = 0
player2_score = 0

@lives1 = player1_lives
@lives2 = player2_lives
@score1 = player1_score
@score2 = player2_score

puts "Player 1 . . . What is your name?"
@player1 = gets.chomp
puts "Player 2 . . . What is your name?"
@player2 = gets.chomp

def player_1_turn

	num1 = rand(20)
	num2 = rand(20) 
	question = "#{num1} + #{num2}"
	puts "What is #{question}?" 
	answer = num1 + num2
	response = gets.chomp.to_i
	# binding.pry

		if response == answer
		  @score1 += 1
		  puts "Correct!".green + " #{@player1} your score is #{@score1} . . . you have #{@lives1} lives remaining"
		  puts
		  puts "#{@player2}".bold + ", your next question . . . ".blue
		else
 		  @lives1 -= 1
		  puts "Incorrect!".red + " #{@player1}, your score is #{@score1} . . . you have #{@lives1} lives remaining"
		  puts		
		  puts "#{@player2}".bold + ", your next question . . . ".blue 
		end
end

def player_2_turn

	num1 = rand(20)
	num2 = rand(20) 
	math_arr = ["+", "-", "*", "/"]
	math_op = math_arr.sample
	question = "#{num1} + #{num2}"
	puts
	puts "What is #{question}?" 
	answer = num1 + num2
	response = gets.chomp.to_i
	# binding.pry

	if response == answer
	  @score2 += 1
	  puts "Correct!".green + " #{@player2}, your score is #{@score2} . . . you have #{@lives2} lives remaining"
	  puts
	  puts "#{@player1}".bold + ", your next question . . . ".blue
	else
 	  @lives2 -= 1
	  puts "Incorrect!".red + " #{@player2}, our score is #{@score2} . . . you have #{@lives2} lives remaining"	
	  puts
	  puts "#{@player1}".bold + ", your next question . . . ".blue
	end
end

def play_game 
	until @lives1 == 0 || @lives2 == 0
		player_1_turn
		if @lives1 == 0
			puts "#{@player2} WINS!! Sorry, #{@player1} . . . YOU LOSE!!".bold
			puts
			puts "#{@player1} & #{@player2}, would you like to play again?? (type Yes or No)"
			response = gets.chomp				
			if response == "yes" 
				play_game
			else
				exit
			end
		end		
		player_2_turn
		if @lives2 == 0
			puts "#{@player1} WINS!! Sorry, #{@player2}. . . YOU LOSE!!".bold
			puts
			puts "#{@player1} & #{@player2}, would you like to play again?? type Yes or No)"
			response = gets.chomp
			if response == "yes" 
				play_game				
			else
				exit
			end
		end
	end
end

play_game
