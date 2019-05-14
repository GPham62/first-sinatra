require 'sinatra'
require 'sinatra/reloader' if development?

SECRET_NUM = rand(100)
@@turn = 5

get '/' do
  guess = params['guess']
  cheat = params['cheat']
  if cheat
    cheat_mode = true
  end
  message, background = check_guess(guess)
  # erb :index, :locals => {:number => SECRET_NUM, :message => message, :background => background, :turn => @@turn}
  if params['guess'] != nil
    @@turn -= 1
    if @@turn == 0 || message == "You got it right!"
      if message != "You got it right!"
        message = "YOU LOSE! The number has changed!"
      end
      @@turn = 5
      SECRET_NUM = rand(100)
    end
  end
  erb :index, :locals => {:cheat_mode => cheat_mode, :number => SECRET_NUM, :message => message, :background => background, :turn => @@turn}
end

def check_guess(guess)
  number = SECRET_NUM
  return "" if guess == nil
  guess = guess.to_i
  if guess > number && guess < 102
    if guess > number + 5
      return ["Way too high", '#FF0000']
    end
      return ["Too high", '#ef95a7']
    elsif guess < number && guess > -1
      if guess + 5 < number
        return ["Way too low", '#FF0000']
      end
      return ["Too low", '#ef95a7']
    else return ["You got it right!", '#ADFF2F']
  end
end