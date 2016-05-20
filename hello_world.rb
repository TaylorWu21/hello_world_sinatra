require 'sinatra'
require 'pry'
require 'babbler'

# Sinatra is a DSL(Domain Specific Language)

# Root URL
get '/' do
  "Hello World"
end

get '/hello' do
  "Hello"
end

# Params is just a ruby hash
# dynamic route
get '/hello/:name' do
  "Hello, #{params[:name]}"
end

#URL parameters
get '/hello/:name/:age' do
  age = params[:age].to_i + 10
  "#{params[:name]} age is now: #{age}"
end

# Query String parameters
# Starts with a question mark(?)
# http://localhost:4567/sport?favorite=snowboarding
# to add another key/value pair use &
get '/sport' do
  name = params[:name]
  if params[:favorite] == 'snowboarding'
    "You're Awesome - #{name}!!"
  else
    "Do you even ride, #{name}?"
  end
end

get '/numbers' do
  @numbers = [1,2,3,4,5,6,7,8,9,10]
  erb :numbers
end

get '/secret' do 
  erb :secret
end

get '/zoo' do
  @animals = ['Taylor Wu', 'Jake Sorce', 'Will liang', 'Ty Diamse', 'Nhi Doan']
  @name = 'Taylor Wu'
  #ERB always calls the last line
  erb :zoo
end

post '/secret' do
  params[:message].reverse
end

not_found do
  status 404
  'not found'
end















