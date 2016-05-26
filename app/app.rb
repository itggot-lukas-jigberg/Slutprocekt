class App < Sinatra::Base
  enable :sessions

  accessible = ['/welcome', '/login', '/sign-up']


  before do
    if accessible.include?(request.path_info)

      if session[:user_id]
        redirect '/user'
      end

    else

      unless session[:user_id]
        redirect '/welcome'
      end
    end
  end

  get '/' do

    erb :notes
  end

  get '/create-notis' do

    erb :create
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

  post '/login' do
    user = User.first(username: params["username"])
    if user && user.password == params["password"]
      session[:user_id] = user.id
      redirect '/'
    else
      redirect '/login'
    end
  end

  post '/sign-up' do
    if session[:user_id]
      redirect '/'
    else
      if params["password"] == params["password_repeat"]
        user = User.create(username: params["username"], mail: params["email"], password: params["password"])
        if User.get(user.id)
          session[:user_id] = user.id
          redirect '/login'
        end
        redirect '/sign-up'
      end
    end
  end


  post '/logout' do
    p session
    session.destroy
    p session
    redirect '/'
  end