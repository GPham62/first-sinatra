require 'sinatra'
require 'sinatra/reloader'

SECRET_NUM = rand(100)

get '/' do
  number = SECRET_NUM
  guess = params['guess']
  message, background = check_guess(guess)
  erb :index, :locals => {:number => number, :message => message, :background => background}
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