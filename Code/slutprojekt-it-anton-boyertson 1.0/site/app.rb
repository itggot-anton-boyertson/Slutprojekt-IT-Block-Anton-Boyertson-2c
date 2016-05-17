class App < Sinatra::Base
  enable :sessions

  get '/' do
    if session[:user_id]
      @current_user = User.get(session[:user_id])
      erb :homepage
    else
      erb :index
    end
  end

  post '/logout' do
    session[:user_id] = nil
    redirect '/'
  end

  post '/login' do
    user = User.first(username: params['username'])
    if user && user.password == params['password']
      session[:user_id] = user.id
      redirect '/'
    else
      redirect '/register'
    end
  end

  get '/register' do
    erb :register
  end

  post '/user/create' do
    user = User.create(first_name: params['first_name'],
                       last_name: params['last_name'],
                       username: params['username'],
                       password: params['password'],
                       mobil: params['mobil'],
                       e_mail_address: params['e_mail_address'])
    if user.valid?
      redirect '/'
    else
      redirect '/register'
    end
  end

  get '/contacts' do
    if session[:user_id]
      @current_user = User.get(session[:user_id])
    end
    erb :contacts
  end

  get '/settings' do
    if session[:user_id]
      @current_user = User.get(session[:user_id])
      erb :settings
    else
      redirect '/'
    end
  end
end
