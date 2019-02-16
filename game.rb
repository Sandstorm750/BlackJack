require_relative 'user.rb'
require_relative 'cards.rb'
require 'byebug'

class Game

  attr_accessor :bank

  def initialize    
    @dealer = Dealer.new
    @bank = 0    
  end

  def start

    puts "Введите Ваше имя"
    name = gets.to_s.chomp

    if name != ""
      @user = User.new(name)
    else
      return puts "Вы не ввели имя"
    end    

    loop do
      game_begin
      
      loop do        
        puts "  Выберите действие, введя его номер из списка:

          1. Пропустить
          2. Добавить карту
          3. Открыть карты"
          puts

        input = gets.chomp.to_i
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
    if @dealer.points_sum < 17
      @dealer.us_cards << @cards.take_card
      @cards.card_deck.delete(@user.us_cards[-1])
    end

    @user.us_show
    @dealer.stars
  end

  def add_cards
    if @user.us_cards.size < 3
      @user.us_cards << @cards.take_card
      @cards.card_deck.delete(@user.us_cards[-1])
    end

    if @dealer.us_cards.size < 3 && @dealer.points_sum < 17
      @dealer.us_cards << @cards.take_card
    end
       
    @user.us_show
    @dealer.us_show
    
    result
  end

  def open_cards
    @user.us_show
    @dealer.us_show
    result
  end

  def game_begin
    @cards = Cards.new    

    @user.us_cards.clear
    @dealer.us_cards.clear

    bank_begin
    show_bank
    
    @user.us_cards << @cards.drop[0]
    @user.us_cards << @cards.drop[1]
    @dealer.us_cards << @cards.drop[2]
    @dealer.us_cards << @cards.drop[3]    
    
    @user.us_show
    @dealer.stars
  end

  def bank_begin
    if @user.money == 0 || @dealer.money == 0
      puts "При отсутствии у одного из игроков баксов
            игра продолжаться не может!!!"
      exit
    end
    @user.money -= 10
    @dealer.money -= 10
    @bank += 20    
  end

  def show_bank
    puts "У Вас $#{@user.money}"
    puts "У Дилера $#{@dealer.money}"
    puts "В банке $#{bank}" 
  end

  def result
    if (@user.points_sum > @dealer.points_sum) && @user.points_sum <= 21      
      puts "Победитель #{@user.name}!!!"
      @user.money += bank
    elsif
      (@dealer.points_sum > @user.points_sum) && @dealer.points_sum <= 21      
      puts "Победитель #{@dealer.name}!"
      @dealer.money += bank
    elsif
      @user.points_sum <= 21 && @dealer.points_sum > 21
      puts "Победитель #{@user.name}!!!"
      @user.money += bank
    elsif
      @dealer.points_sum <= 21 && @user.points_sum > 21
      puts "Победитель #{@dealer.name}!"
      @dealer.money += bank
    else      
      puts "    Ничья!!!"      
      @user.money += bank/2
      @dealer.money += bank/2      
    end
    @bank -= @bank
    show_bank    
  end

  def end_game
    puts "Хотите продолжить игру? Выберите номер ответа:
    1. ДА !!!
    2. НЕТ((("

    input = gets.chomp.to_i
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

