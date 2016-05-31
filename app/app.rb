class App < Sinatra::Base
  enable :sessions

  accessible = ['/welcome', '/login', '/sign-up']


  before do
    if accessible.include?(request.path_info)

      if session[:user_id]
        redirect '/'
      end

    else

      if session[:user_id]
        @user = User.get(session[:user_id])
      else
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

    erb :invites
  end

  get '/share' do

    erb :share
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
          #session[:user_id] = user.id
          redirect '/login'
        end
        redirect '/sign-up'
      end
    end
  end

  post '/create_note' do
    time_stamp = DateTime.parse(params["time"]) rescue time_stamp = nil
    note = Note.create(titel: params["titel"], info: params["information"], time_stamp: params["time"], user_id: @user.id)
    if Note.get(note.id)
      redirect "/note/#{note.id}"
    else
      redirect back
    end
  end

  get '/note/:note_id' do |note_id|
    @note = Note.get(note_id)
    if @note.user == @user
      erb :note
    else
      redirect back
    end
  end

  post '/logout' do
    p session
    session.destroy
    p session
    redirect '/'
  end
end