class App < Sinatra::Base
  enable :sessions

  before do
    if session[:user_id]
      @current_user = User.get(session[:user_id])
    end
  end

  get '/' do
    if @current_user
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
    erb :contacts
  end

  get '/settings' do
    if @current_user
      erb :settings
    else
      redirect '/'
    end
  end

  get '/new_list' do
    if @current_user
      erb :newlist
    else
      redirect '/'
    end
  end

  get '/contributed_lists' do
    if @current_user
      erb :contributed_lists
    else
      redirect '/'
    end
  end

  get '/my_lists/:lists_id' do |list_id|
    if @current_user
      @list = List.get(list_id)
      @item = @list.items
      @users = UserList.all(list: @list).users


      erb :my_lists
    else
      redirect '/'
    end
  end

  post '/remove/:lists_id' do |lists_id|
    user_list = UserList.first(:list_id => lists_id)
    user_list.list.items.destroy
    user_list.list.destroy
    user_list.destroy
    redirect '/'
  end

  post '/add_item' do
    item = Item.create(item_name: params['item_name'],
                       list_id: params['list_id'])

    redirect "/my_lists/#{params['list_id']}"
    # if item.valid?
    #   redirect "/my_lists/#{params['list_id']}"
    # else
    #   redirect "/my_lists/#{params['list_id']}"
    # end
  end

  post '/done_items/:item_id' do |item_id|
    current_user = User.get(session[:user_id])
    current_item = Item.get(item_id)
    current_item.destroy
    redirect back
  end

  post '/add_user/:list_id' do |list_id|
    add_user = User.first(username: params['username'])
    user_list = UserList.create(list_id: list_id,
                                user_id: add_user.id,)

    redirect "/my_lists/#{params['list_id']}"
  end

  post '/list/create' do
    if @current_user
      list = List.create(list_name: params[:list_name], list_description: params[:list_description])
      user_list = UserList.create(user: @current_user, list: list)
      redirect "/my_lists/#{list.id}"
    end
    redirect '/'
  end

end
