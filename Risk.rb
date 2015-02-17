class Player
	attr_accessor :name
	def initialize(name)
	 raise "Player name is not given as a string" unless name.is_a?(String)
	 @name = name
	end
end

class Country
	attr_accessor :owner
	def initialize(position, owner, army)
	 raise "Army is not given as a number" unless army.is_a?(Numeric)
	 raise "Owner is not given as a string" unless owner.is_a?(String)
	 raise "Position is not given as a number" unless position.is_a?(Numeric)
	 @position = position
	 @owner = owner
	 @army = army || 10
	end
	
	def change_owner(country)
	 if country.owner == "#{Player1.name}" then country.owner = "#{Player2.name}"
	 else country.owner = "#{Player1.name}"
	 end
	end
	
	
	def change_army(country, new_army)
	end
end 

class Board
	def initialize(countries)
	 raise "Countries is not given as a string" unless countries.is_a?(String)
	 @contries = contries
	end
	
	def attack(from, to)
	 
	end
	
	def transfer(from, to)
	 
	end
	
	def move(from, to)
	 
	end
	
	def valid_move()
	 true
	end
	
	def redo_move()
	 true
	end
	
	def reset()
	 true
	end
	
end #ends the board class

class Game
	attr_accessor :player
	
	def initialize(player, board)
	 @player = player
	 @board = ["Alaska    ", "Canada     ", " France    ", "Russia    ",
	           "WestUS    ", "EastUS     ", " India     ", "China     ",
			   "Mexico    ", "Caribbean  ", " Algeria   ", "Egypt     ",
			   "Chile     ", "Brazil     ", " Angola    ", "Madagascar"]
	end
	 
	def play_game()
	 draw_board()
	 switch_player()
	 puts current_player()
	end
	
	def draw_board
	 puts nil
	 puts [@board[0], @board[1], @board[2], @board[3]].join(' ')
	 puts [@board[4], @board[5], @board[6], @board[7]].join(' ')
	 puts nil
	 puts [@board[8], @board[9], @board[10], @board[11]].join(' ')
	 puts [@board[12], @board[13], @board[14], @board[15]].join(' ')
	 puts nil
	end
	
	def switch_player()
	 if @player == "#{Player1.name}"
	  @player = "#{Player2.name}"
	 else @player = "#{Player1.name}"
	 end
	end
	
	def current_player()
	 @player
	end
	
	def check_win()
	 true
	end
	
	def show_win()
	 "Win"
	end
	
end #ends the game class

puts "What is first players name?"
Player1 = Player.new(gets.chomp)

puts "What is second players name?"
Player2 = Player.new(gets.chomp)

Risk = Game.new(Player1.name, @board)

#prepare the bass state of countries

Risk.play_game()