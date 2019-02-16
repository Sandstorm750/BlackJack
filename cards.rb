class Cards

  attr_accessor :dropped_cards
  attr_reader :card_deck

  def initialize
    @dropped_cards = []
    @card_deck = [ '2♥', '3♥', '4♥', '5♥', '6♥', '7♥', '8♥', '9♥', '10♥', 'V♥', 'D♥', 'K♥', 'T♥',
        '2♠', '3♠', '4♠', '5♠', '6♠', '7♠', '8♠', '9♠', '10♠', 'V♠', 'D♠', 'K♠', 'T♠',
        '2♣', '3♣', '4♣', '5♣', '6♣', '7♣', '8♣', '9♣', '10♣', 'V♣', 'D♣', 'K♣', 'T♣',
        '2♦', '3♦', '4♦', '5♦', '6♦', '7♦', '8♦', '9♦', '10♦', 'V♦', 'D♦', 'K♦', 'T♦'
      ]
  end

  def card_deck
    @card_deck
  end

  def dropped_cards
    @dropped_cards
  end

  def take_card
    choose = rand(@card_deck.length)
    @card_deck[ choose - 1 ]    
  end

  def drop
    while @dropped_cards.size < 4 do
      @dropped_cards << take_card
      @card_deck.delete(@dropped_cards[-1])
    end
    @dropped_cards    
  end
end

