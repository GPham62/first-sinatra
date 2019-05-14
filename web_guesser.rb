require 'sinatra'
require 'sinatra/reloader'

SECRET_NUM = rand(100)

get '/' do
  number = SECRET_NUM
  guess = params['guess']
  message = check_guess(guess)
  erb :index, :locals => {:number => number, :message => message}
end

def check_guess(guess)
  number = SECRET_NUM
  return "" if guess == nil
  guess = guess.to_i
  if guess > number && guess < 102
    if guess > number + 5
      return "Way too high"
    end
      return "Too high"
    elsif guess < number && guess > -1
      if guess + 5 < number
        return "Way too low"
      end
      return "Too low"
    else return "You got it right!"
  end
end