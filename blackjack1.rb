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
	total=0
	count=0
	cards.each do |suit, value|
		count++
		if(value=='Q' || value=='K' || value=='J')
			blackjackvalue=10
			total=+blackjackvalue
		elsif(value=='A')
			if((total+11)<21)
			  blackjackvalue=11
			  total=+blackjackvalue
			else
				blackjackvalue=1
				total=+blackjackvalue
			end
		else 
			blackjackvalue=value.to_i
			total=+blackjackvalue
		end
	end
	puts "count"+" "count.to_s
	return total
end

#deal cards
player=[]
round1=make_round(deck)
round2=make_round(deck)
player<<round1<<round2
total=calculate(player)
puts "total"+" "+total.to_s
#player_total=calculate(player)

dealer=[]
round1=make_round(deck)
round2=make_round(deck)
dealer<<round1<<round2

#dealer_total=calculate(dealer)




#puts "Dealer has #{dealer[0]} and #{dealer[1]} for a total of #{dealer_total}"
puts "Player has #{player[0]} and #{player[1]} for a total of #{total}"

#puts "what would you like to do? 1) hit 2) stay"
#move=gets.chomp
