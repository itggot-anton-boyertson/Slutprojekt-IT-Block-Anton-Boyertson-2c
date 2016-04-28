class Item
  include DataMapper::Resource

  property :user_id, Serial
  property :list_is, Serial

  belongs_to :list
end