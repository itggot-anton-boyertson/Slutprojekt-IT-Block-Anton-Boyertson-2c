class UserList
  include DataMapper::Resource

  belongs_to :list, :key => true
  belongs_to :user, :key => true

  end



