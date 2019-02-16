class User

  attr_accessor :name, :money
  
  def initialize(name)
    @name = name
    @money = 100
    @user_cards = []    
  end

  def us_cards
    @user_cards
  end

  def money
    @money
  end

  def points_sum
    sum = 0
    @user_cards.each do |card|
      if card.chars.size == 3 || %w(V D K).include?(card[0])
        val = 10
      elsif card[0].include?('T')
        sum <= 10 ? val = 11 : val = 1
      else
        val = card.chars.shift.to_i
      end
      sum += val
    end
    sum
  end

  def us_show
    if @user_cards.length == 2
      puts "Ваши карты: #{@user_cards[0]} и #{@user_cards[1]}"
      puts "Ваши очки: #{points_sum}"
    else
      puts "Ваши карты: #{@user_cards[0]}, #{@user_cards[1]} и #{@user_cards[2]}"
      puts "Ваши очки: #{points_sum}"
    end    
  end  
end

class Dealer < User

  def initialize(name = 'Dealer')
    super(name)
    @name = name
  end

  def us_show
    if @user_cards.length == 2
      puts "Карты Дилера: #{@user_cards[0]} и #{@user_cards[1]}"
      puts "Очки Дилера: #{points_sum}"
    else
      puts "Карты Дилера: #{@user_cards[0]}, #{@user_cards[1]} и #{@user_cards[2]}"
      puts "Очки Дилера: #{points_sum}"
    end    
  end

  def stars
    if @user_cards.length == 2
      puts "Карты дилера: | * , * |"
      puts "Очки Дилера: | * |"
    else
      puts "Карты дилера: | * , * , * |"
      puts "Очки Дилера: | * |"
    end       
  end
end

