class App < Sinatra::Base
  enable :sessions

  get '/' do

  	erb :notes
  end

  get '/welcome' do

    erb :logorsign, layout: false
  end

  get '/login' do


    erb :login, layout: false
  end

  get '/sign-up' do

    erb :signup, layout: false
  end

  get '/user' do

    erb :user
  end

  get '/contacts' do

    erb :contacts
  end

  get '/invites' do

  end


end