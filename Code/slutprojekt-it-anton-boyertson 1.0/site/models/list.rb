class List
  include DataMapper::Resource

  property :id, Serial
  property :list_name, String, required: true
  property :list_description, String, required: true

  has n, :user_lists
  has n, :users, :through => :user_lists
  has n, :items
end