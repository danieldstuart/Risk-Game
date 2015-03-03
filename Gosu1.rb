require 'gosu'

class GameWindow < Gosu::Window
	def initialize
		super(640, 480, false)
		self.caption = "Game Window"
		@font = Gosu::Font.new(self, Gosu::default_font_name, 20)
	end

	def needs_cursor?
		true
	end
	
	def update
		draw()
	end
	
	def color(owner)
		if owner == "player1" then Gosu::Color.argb(0xff0000ff)
		else Gosu::Color.argb(0xffff0000)
		end
	end
	
	def draw()
		draw_line(320, 0, Gosu::Color.argb(0xffffffff), 320, 480, Gosu::Color.argb(0xffffffff), 1)
		draw_line(0, 240, Gosu::Color.argb(0xffffffff), 640, 240, Gosu::Color.argb(0xffffffff), 1)
		@font.draw("North America", 0, 0, 1, 1, 1, 0xffffffff)
		@font.draw("Europe", 320, 0, 1, 1, 1, 0xffffffff)
		@font.draw("South America", 0, 240, 1, 1, 1, 0xffffffff)
		@font.draw("Africa", 320, 240, 1, 1, 1, 0xffffffff)
		@font.draw("#{North_America.army}", 0, 20, 1, 1, 1, 0xffffffff)
		@font.draw("#{Europe.army}", 320, 20, 1, 1, 1, 0xffffffff)
		@font.draw("#{South_America.army}", 0, 260, 1, 1, 1, 0xffffffff)
		@font.draw("#{Africa.army}", 320, 260, 1, 1, 1, 0xffffffff)
		
	end
end
	
class Country
	attr_accessor :owner
	attr_accessor :army
	def initialize(position, owner, army)
		raise "Army is not given as a number" unless army.is_a?(Numeric)
		raise "Owner is not given as a string" unless owner.is_a?(String)
		raise "Position is not given as a number" unless position.is_a?(Numeric)
		@position = position
		@owner = owner
		@army = army || 10
	end
	
	def change_owner(country)
		if country.owner == "player1" then country.owner = "player2"
		else country.owner = "player1"
		end
	end
	
	def change_army(country, new_army)
		country.army = new_army
	end
end 

class Game
	
	def initialize(player, board)
		@player = player
		@board = board
	end
	 
	def play_game()
		#move()
		#check_move()
	end
	
	def switch_player()
		if @player == "player1"
			@player = "player2"
		else @player = "player1"
		end
	end
	
	def check_win()
		true
	end
	
	def show_win()
		"Win"
	end
	
end

North_America = Country.new(1, "player1", 10) 
Europe = Country.new(2, "player2", 10)
South_America = Country.new(3, "player2", 10)
Africa = Country.new(4, "player1", 10)

Risk = Game.new("player1", @board)

Risk.play_game()

window = GameWindow.new
window.show

