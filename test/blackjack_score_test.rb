require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do

    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert <-  You do this part!
    expect(score).must_equal(7)
  end

  describe 'facecards have values calculated correctly' do

    it 'checks if Jack is 10 ' do

      # Arrange
      hand = ["Jack", 2]

      # Act
      score = blackjack_score(hand)

      # Assert
      expect(score).must_equal(12)
    end

    it 'checks if Queen is 10 ' do

    # Arrange
    hand = ["Queen", 2]

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal(12)
    end

    it 'checks if King is 10 ' do

    # Arrange
    hand = ["King", 2]

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal(12)
    end
  end

  it 'calculates aces as 11 where it does not go over 21' do

    # Arrange
    hand = [10, "Ace"]

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal(21)
  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do

    # Arrange
    hand = ["Ace", 10, "King"]

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal(21)
  end

  it 'raises an ArgumentError for Number of hand greater than 5' do

    # Arrange
    hand = [6, 2, 4, 3, 1, 5]

    # Assert
    expect{
      blackjack_score(hand)
    }.must_raise ArgumentError
  end

  it 'raises an ArgumentError for Number of hand smaller than 2' do

    # Arrange
    hand = [6]

    # Assert
    expect{
      blackjack_score(hand)
    }.must_raise ArgumentError
  end

  describe 'raises an ArgumentError for invalid cards' do

      it 'detects if cat is invalid' do
      # Arrange
      hand = ["cat", "Ace"]

      # Assert
      expect{
        blackjack_score(hand)
      }.must_raise ArgumentError
    end

    it 'detects if invalid number is invalid' do

    # Arrange
    hand = [35, "Ace"]

    # Assert
    expect{
      blackjack_score(hand)
    }.must_raise ArgumentError
    end
  end

  it 'raises an ArgumentError for scores over 21' do

    # Arrange
    hand = ["Jack", "King", 5]

    # Assert
     expect{
       blackjack_score(hand)
     }.must_raise ArgumentError
  end
end

