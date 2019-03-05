module Interface

  def user_name

    begin
      puts "Введите Ваше имя"
      name = gets.to_s.chomp.capitalize

      @user = User.new(name)

    rescue RuntimeError => e
      puts "#{e.message} Попытайтесь снова."
      retry
    end
  end

  def actions
    puts "  Выберите действие, введя его номер из списка:

          1. Пропустить
          2. Добавить карту
          3. Открыть карты"
          puts
  end

  def choice
    gets.to_i
  end

  def money_zero
    if @user.money == 0 || @dealer.money == 0
      puts "При отсутствии у одного из игроков баксов
            игра продолжаться не может!!!"
      exit
    end
  end

  def card_show(user)
    puts "Ваши карты: #{@user.hand.show_current}"
    puts "Ваши очки: #{@user.hand.points}"
  end

  def dealer_show(dealer)
    puts "Карты Дилера: #{@dealer.hand.show_current}"
    puts "Очки Дилера: #{@dealer.hand.points}"
  end

  def stars(dealer)
    puts "Карты дилера: |" + ' * |' * @dealer.hand.current.size
    puts "Очки Дилера: | * |"
  end

  def show_bank
    puts "У Вас $#{@user.money}"
    puts "У Дилера $#{@dealer.money}"
    puts "В банке $#{bank}"
  end

  def result
    if (@user.hand.points > @dealer.hand.points) && @user.hand.points <= 21
      puts "Победитель #{@user.name}!!!"
      @user.money += bank
    elsif
      (@dealer.hand.points > @user.hand.points) && @dealer.hand.points <= 21
      puts "Победитель #{@dealer.name}!"
      @dealer.money += bank
    elsif
      @user.hand.points <= 21 && @dealer.hand.points > 21
      puts "Победитель #{@user.name}!!!"
      @user.money += bank
    elsif
      @dealer.hand.points <= 21 && @user.hand.points > 21
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

  def desire
    puts "Хотите продолжить игру? Выберите номер ответа:
    1. ДА !!!
    2. НЕТ ((("
  end
end

