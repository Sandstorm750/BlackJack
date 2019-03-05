class Deck

  attr_reader :cards, :values, :shirts

  def initialize
    @cards = []
    values = %w(2 3 4 5 6 7 8 9 10 V D K T)
    shirts = [ '♥', '♠', '♣', '♦']
    values.each do |value|
      shirts.each do |shirt|
        @cards << Card.new(value, shirt)
      end
    end
  end

  def get_card
    @cards [ rand(@cards.size) - 1 ]
  end
end

