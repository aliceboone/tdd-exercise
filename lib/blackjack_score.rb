# blackjack_score.rb

VALID_CARDS = {2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, 10 => 10, "Jack"  =>  10, "Queen"  => 10, "King"  => 10, "Ace" => 11}

def blackjack_score(hand)

  score = 0
  ace_count = 0

  if hand.length > 5
    raise ArgumentError, "Number of hand is greater than 5"
  end

  if hand.length < 2
    raise ArgumentError, "Number of hand is smaller than 2"
  end

  hand.each do |card|
    card_score = VALID_CARDS[card]
    if card_score.nil?
      raise ArgumentError, "The card is invalid"
    end

    if card == "Ace"
      ace_count += 1
    end
    score += card_score
  end

    while score > 21 && ace_count > 0
      ace_count -= 1
      score -= 10
    end

    if score > 21
      raise ArgumentError, "Score is greater than 21"
    end

  return score
end

# blackjack_score(VALID_CARDS)
