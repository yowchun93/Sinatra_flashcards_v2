class Card < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :deck

end
