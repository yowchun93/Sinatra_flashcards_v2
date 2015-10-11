# Seeding file to create existing user into the application 

# first create a user 
User.create(name: "Jordan")

#second step create a deck of cards 
@capital_of_countries = Deck.create(name: "Capital of countries")

#create a list of cards which belongs to decks
Card.create(deck: @capital_of_countries,definition: "Capital of Russia",answer: "Mosow")
Card.create(deck: @capital_of_countries,definition: "Capital of Malaysia",answer: "Kuala Lumpur")

@pokemon_deck = Deck.create(name: "Pokemons")

Card.create(deck: @pokemon_deck,definition: "A cute mouse pokemon",answer: "Pikachu")
Card.create(deck: @pokemon_deck,definition: "A fire lizard pokemon",answer: "Charizard")

@user = User.first
# select the first deck , should be changed
@deck = Deck.find(1)
#create round 
@round = Round.create(user: @user,deck: @deck)





