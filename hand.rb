class Hand

  attr_accessor :current
  attr_reader :deck

  def initialize
    @current = []
  end

  def add_card(deck)
    @current << deck.get_card
    deck.cards.delete(current[-1])
  end  

  def points
    points = 0
    @current.each do |card|
      if %w(V D K).include?(card.value)
        val = 10
      elsif card.value.include?('T')
        points <= 10 ? val = 11 : val = 1
      else
        val = card.value.to_i
      end
      points += val
    end
    points
  end

  def show_current
    @current.map {|card| card.value + card.shirt}.join (', ')
  end
end

