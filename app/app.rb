class App < Sinatra::Base
  enable :sessions

  get '/' do

  	erb :notes
  end


end