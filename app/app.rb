class App < Sinatra::Base
  enable :sessions

  get '/' do
    if session[:user_id]
      @user = User.get(session[:user_id])
    else
      redirect '/welcome'
    end
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

    if session[:user_id]
      @user = User.get(session[:user_id])
    else
      redirect '/welcome'
    end

    erb :user
  end

  get '/contacts' do

    if session[:user_id]
      @user = User.get(session[:user_id])
    else
      redirect '/welcome'
    end

    erb :contacts
  end

  get '/invites' do

    if session[:user_id]
      @user = User.get(session[:user_id])
    else
      redirect '/welcome'
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

  # post '/sign-up' do
  #   if session[:user_id]
  #     redirect '/'
  #   else
  #     if 5 < params["password"].length && params["password"].length < 16
  #       if params["password"] == params["password_repeat"]
  #         User.create(username: params["username"], mail: params["email"], password: params["password"])
  #         redirect '/login'
  #       else
  #         redirect '/sign-up'
  #       end
  #     else
  #       redirect '/sign-up'
  #     end
  #   end
  # end

  post '/logout' do
    p session
    session.destroy
    p session
    redirect '/'
  end

end