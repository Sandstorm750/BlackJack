class User

  attr_accessor :name, :money, :cards
  
  def initialize(name)
    @name = name
    @money = 100
    @cards = []
  end

  def cards
    @cards
  end

  # def cards_points

  # end

  
end

class Diler < User
end
