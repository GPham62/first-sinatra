require 'sinatra'
require 'sinatra/reloader'

get '/' do
  X = rand(101)
  "The SECRET NUMBER is #{X}"
end
