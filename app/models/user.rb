class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_many :rounds
	validates :name, uniqueness: true 

end
