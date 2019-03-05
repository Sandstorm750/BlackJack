class User

  attr_accessor :name, :money, :hand
 
  def initialize(name)
    @name = name
    validate!
    @money = 100
    @hand = Hand.new
  end

  def rate
    @money -= 10
  end

  def valid?
    validate!
  rescue
    false
  end

  def validate!
    raise "Вы не ввели имя." if name.size < 1
    true        
  end
end

class Dealer < User

  def initialize(name = 'Dealer')
    super(name)
    @name = name
  end
end

