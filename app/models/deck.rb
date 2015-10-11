class Deck < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_many  :rounds
	has_many :cards 
end
