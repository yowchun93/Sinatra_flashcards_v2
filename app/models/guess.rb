class Guess < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :card 
	belongs_to :round 
end
