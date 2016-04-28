class App < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/login' do
    p params
    redirect '/'
  end

  get '/register' do
    erb :register
  end

  post '/user/create' do
    #user = User.create(first_name: params['first_name'],
    #                  last_name: params['last_name'],
    #                 username: params['username'],
    #                password: params['password'],
    #               mobil: params['mobil'],
    #              e_mail_adress: params['e_mail_adress'])
    redirect '/'
  end


end