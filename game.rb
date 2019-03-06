require_relative 'user.rb'
require_relative 'card.rb'
require_relative 'deck.rb'
require_relative 'hand.rb'
require_relative 'interface.rb'

class Game
  include Interface

  attr_accessor :bank, :deck

  def initialize
    @dealer = Dealer.new
    @bank = 0    
  end

  def start
    user_name

    loop do
      game_begin
      
      loop do
        actions

        input = choice
        case input
          when 1
            pass
          when 2
            add_cards
            break
          when 3
            open_cards
            break
        end
      end
      end_game
    end
  end

  def pass
    if @dealer.hand.points < 17
      @dealer.hand.add_card(@deck)
    end

    card_show(@user)
    stars(@dealer)
  end

  def add_cards
    if @user.hand.current.size < 3
      @user.hand.add_card(@deck)
    end

    if @dealer.hand.current.size < 3 && @dealer.hand.points < 17
      @dealer.hand.add_card(@deck)
    end

    card_show(@user)
    dealer_show(@dealer)
    result
  end

  def open_cards    
    card_show(@user)
    dealer_show(@dealer)
    result    
  end

  def game_begin
    @deck = Deck.new
    
    @user.hand.current.clear
    @dealer.hand.current.clear

    bank_begin

    2.times { @user.hand.add_card(@deck) }
    2.times { @dealer.hand.add_card(@deck) }
    
    card_show(@user)
    stars(@dealer)
  end

  def bank_begin
    money_zero
    @user.rate
    @dealer.rate 
    @bank += 20
    show_bank
  end

  def end_game
    desire

    input = choice
    case input
      when 1
        return
      when 2
        exit
    end
  end
end

game = Game.new
game.start

