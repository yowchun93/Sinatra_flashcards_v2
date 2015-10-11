require 'byebug'
# create a round of game using a deck 
get '/home' do 
	erb :home
end

get '/round' do
	# only 1 user in this prototype 
	@decks = Deck.all
	erb :round 
end
#create the rounds 
post '/round' do 
	# @user = User.first 
	# find the deck according to user input 
	@deck = Deck.find_by(id: params[:answer])
	@user = User.find(1)
	#create a round with that deck
	@round = Round.create(user: @user,deck: @deck)
	session[:round_id] = @round.id
	redirect to '/guess'
end
#create guess
get '/guess' do
	@ended = false
	# a bunch of code to remove duplicate stuffs
	# @round = Round.find_by(id: session[:round_id])
	@round = Round.find_by(id: session[:round_id])
	# set round_id 
	@deck = @round.deck.cards.flatten
	@previous_guesses = Guess.where(round_id: @round.id)
	@used_cards = []
	@previous_guesses.each{|x| @used_cards << x.card }
	@deck.delete_if {|x| @used_cards.include?(x)}
	### ### ### 
	if @deck == []
		@ended = true 
	else
		@card = @deck.sample
		@definition = @card.definition
		#start the guess 
		@guess = Guess.create(card_id: @card.id,round_id: @round.id)
		session[:guess_id] = @guess.id
	end
	erb :guess
	#attempted = false put them into deck
end
# when submit button is pressed 
post '/guess' do
	@result = false
	@user_answer = params[:answer]
	@guess = Guess.find_by(id: session[:guess_id])
	if @user_answer == @guess.card.answer
		#correct
		#redirect to correct page
		# make guess = true 
		@guess.correctness = true
	else 
		#wrong 
		#redirect to wrong page
		# make guess = false 
		@guess.correctness = false 
	end
	#save the result 
	@guess.save
	redirect to '/guess'
end
# Testing 
get '/guess/testing' do
	# resetting the values 
	Guess.destroy_all
	ActiveRecord::Base.connection.reset_pk_sequence!('guesses')
	redirect to '/guess'
end
# Testing 
get '/round/testing' do
	# resetting the values 
	Round.destroy_all
	ActiveRecord::Base.connection.reset_pk_sequence!('rounds')
	redirect to '/round'
end

get '/result' do
	# Select the total correct answer
	@round = session[:round_id]
	# select guess belonging to tthat round
	@total_correct = Guess.where(correctness: true).count
	@total_wrong = Guess.where(correctness: false).count
	erb :result
end

# reset round 
