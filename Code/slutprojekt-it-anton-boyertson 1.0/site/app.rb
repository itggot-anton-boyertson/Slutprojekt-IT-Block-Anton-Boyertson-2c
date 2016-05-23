class App < Sinatra::Base
  enable :sessions

  get '/' do
    if session[:user_id]
      @current_user = User.get(session[:user_id])
      @lists = @current_user.lists
      @item = @lists.items
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

  get '/new_list' do
    if session[:user_id]
      @current_user = User.get(session[:user_id])
      erb :newlist
    else
      redirect '/'
    end
  end

  get '/contributed_lists' do
    if session[:user_id]
      @current_user = User.get(session[:user_id])
      erb :contributed_lists
    else
      redirect '/'
    end
  end

  get '/my_lists/:lists_id' do |list_id|
    if session[:user_id]
      @current_user = User.get(session[:user_id])
      @list = List.get(list_id)
      @item = @list.items

      erb :my_lists
    else
      redirect '/'
    end
  end

  post '/remove/:lists_id' do |lists_id|
    current_user = User.get(session[:user_id])
    user_list = UserList.first(:list_id => lists_id)
    user_list.list.items.destroy
    user_list.list.destroy
    user_list.destroy
    redirect '/'
  end

  post '/add_item' do
    item = Item.create(item_name: params['first_name'])
    if item.valid?
      redirect '/my_lists/:lists_id'
    else
      redirect '/my_lists/:lists_id'
    end
  end

  post '/done_items/:item_id' do
    current_user = User.get(session[:user_id])
    current_item = Item.first(:item_id => items_id)
    current_item.destroy
    redirect '/'
  end

end
