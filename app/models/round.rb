class Round < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :user 
	belongs_to :deck 

end
