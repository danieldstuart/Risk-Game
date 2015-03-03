require 'gosu'

class GameWindow < Gosu::Window
	def initialize
		super(640, 480, false)
		self.caption = "Risk"
		@font = Gosu::Font.new(self, Gosu::default_font_name, 20)
	end

	def needs_cursor?
		true
	end
	
	def move()
	end
	
	def update

	end
	
	def button_down(id)
		if id == Gosu::KbEscape
			close
		end
	end
	
	def draw()
		draw_line(320, 0, Gosu::Color.argb(0xffffffff), 320, 480, Gosu::Color.argb(0xffffffff), 3)
		draw_line(0, 240, Gosu::Color.argb(0xffffffff), 640, 240, Gosu::Color.argb(0xffffffff), 3)
		@font.draw("North America", 0, 0, 3, 1, 1, 0xffffffff)
		@font.draw("Europe", 320, 0, 3, 1, 1, 0xffffffff)
		@font.draw("South America", 0, 240, 3, 1, 1, 0xffffffff)
		@font.draw("Africa", 320, 240, 3, 1, 1, 0xffffffff)
		@font.draw("#{North_America.army}", 0, 20, 3, 1, 1, 0xffffffff)
		@font.draw("#{Europe.army}", 320, 20, 3, 1, 1, 0xffffffff)
		@font.draw("#{South_America.army}", 0, 260, 3, 1, 1, 0xffffffff)
		@font.draw("#{Africa.army}", 320, 260, 3, 1, 1, 0xffffffff)
		@font.draw("#{North_America.owner}", 0, 40, 2, 1, 1, 0xffffffff)
		@font.draw("#{Europe.owner}", 320, 40, 2, 1, 1, 0xffffffff)
		@font.draw("#{South_America.owner}", 0, 280, 2, 1, 1, 0xffffffff)
		@font.draw("#{Africa.owner}", 320, 280, 2, 1, 1, 0xffffffff)
		
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
		@army = army
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
	
	def initialize(player)
		@player = player
	end
	 
	def play_game()
		#move()
		#check_win()
		#switch_player()
		#play_game()
	end
	
	def switch_player()
		if @player == "1"
			@player = "2"
		else @player = "1"
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

Risk = Game.new("1")

Risk.play_game()

window = GameWindow.new
window.show

