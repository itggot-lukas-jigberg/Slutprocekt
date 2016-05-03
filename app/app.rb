class App < Sinatra::Base
  enable :sessions

  get '/' do

  	erb :notes
  end

  get '/login' do

    erb :logorsign
  end

  get '/signup' do

  end

  get '/contacts' do

    erb :contacts
  end

  get '/invites' do

  end


end