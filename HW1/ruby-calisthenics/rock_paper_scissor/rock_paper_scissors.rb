=begin

HW 1-2: BASIC OBJECT-ORIENTED PROGRAMMING FOR DESSERT  (100 points possible)
Specs: spec/dessert_spec.rb

Create a class Dessert with getters and setters for name and calories. The constructor should accept arguments for name and calories.
Define instance methods healthy?, which returns true if and only if a dessert has less than 200 calories, and delicious?, which returns true for all desserts.
Create a class JellyBean that inherits from Dessert. The constructor should accept a single argument giving the jelly bean's flavor; a newly-created jelly bean should have 5 calories and its name should be the flavor plus "jelly bean", for example, "strawberry jelly bean".
Add a getter and setter for the flavor.
Modify delicious? to return false if the flavor is licorice, but true for all other flavors. The behavior of delicious? for non-jelly-bean desserts should be unchanged.
  
=end

class RockPaperScissors
	STRATEGY = ['P', 'S', 'R']
	RULES = [['S', 'P'], ['R', 'S'], ['P', 'R']]

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    return raise NoSuchStrategyError , "Strategy must be one of R,P,S" unless STRATEGY.include?player1[1] and STRATEGY.include?player2[1]
  	return player1 if player1[1] == player2[1] or RULES.include?([player1[1], player2[1]])
    player2
  end

  def self.tournament_winner(tournament)
    return self.winner(*tournament) if tournament[0][0].class != Array
    tournament_winner(tournament.map {|t| tournament_winner(t)})
  end

end
