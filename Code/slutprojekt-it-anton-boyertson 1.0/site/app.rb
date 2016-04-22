class App < Sinatra::Base
  enable :sessions

  before do
    @user = User.get(session[:user]) if session[:user]
    unless @user
      redirect '/login'
    end
  end


  get '/grillkorv' do
    if @user
      erb :userloggedin
    else
      erb :slökdjfds
    end

    erb :index
  end


end