## blackjack game

## make deck
deck=['2','2','2','2','3','3','3','3','4','4','4','4','5','5','5','5','6','6','6','6','7','7','7','7',
'8','8','8','8','9','9','9','9','10','10','10','10','J','J','J','J','Q','Q','Q','Q','K','K','K','K','A','A','A','A']

deck.shuffle!

#get the suit of the card
def getSuit card_index
	if card_index%4==0
		return 'spade'
	elsif card_index%4==1
		return 'club'
	elsif card_index%4==2
		return 'diamond'
	elsif card_index%4==3
		return 'heart'
	end
end

def make_round(deck)
	round=[]
		card_dealer_index=rand(52)
		suit=getSuit card_dealer_index
		card_value=deck[card_dealer_index]
	round<<suit<<card_value
	return round
end

def calculate(cards)

	arr=cards.map{|e| e[1] }

	total=0
	arr.each do |value|
		if value=="A"
			total+=11
		elsif value.to_i==0 #J,Q,K
			total+=10
		else
			total+=value.to_i
		end

	end

	arr.select{|e| e=="A"}.count.times do
		total-=10	if total >21
	end

		return total
end

#deal cards
player=[]
round1=make_round(deck)
round2=make_round(deck)
player<<round1<<round2
player_total=calculate(player)

dealer=[]
round1=make_round(deck)
round2=make_round(deck)
dealer<<round1<<round2
dealer_total=calculate(player)

#dealer_total=calculate(dealer)
puts "Dealer has #{dealer[0]} and #{dealer[1]} for a total of #{dealer_total}"
puts "Player has #{player[0]} and #{player[1]} for a total of #{player_total}"

if player_total==21)
	puts 'congratulations, you hit blackjack!'
end

while player_total<21
	puts "what would you like to do? 1) hit 2) stay"
	move=gets.chomp

	if !['1','2'].include?(move)
		puts "Error: you must enter 1 or 2"
		next
	end

	if move=="2"
		put "You chose to stay"
		break;
	end

	round=make_round(deck)
	player<<round
	player_total=calculate(round)
	puts "your total is now #{player_total}"

    if player_total==21
    	puts "congratulations, you hit blackjack! You win!"
    elsif player_total>21
    	puts "Sorry, it looks like you busted!"
    	exit
    end
end
