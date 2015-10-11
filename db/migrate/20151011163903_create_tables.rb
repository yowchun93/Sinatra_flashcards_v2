class CreateTables < ActiveRecord::Migration
	def change
		create_table :decks do |t|
			t.string :name 
			t.timestamps null: false 
		end
		# create cards, card belogns to deck 
		create_table :cards do |t|
			t.references :deck, index: true 
			t.string :answer 
			t.string :definition 
		end
		#create rounds, round belongs to user and deck 
		#create foreign key in rounds 
		create_table :rounds do |t|
			t.references :user, index: true 
			t.references :deck, index: true  
			t.integer :num_guesses 
			t.integer :num_correct 
			t.integer :num_incorrect 
		end
		# create guess, guess belongs to card and round
		#create foreign key in guess 
		create_table :guesses do |t|
			t.references :card, index: true 
			t.references :round , index: true 
			t.boolean :correctness
		end 

	end 
end
