class Item
  include DataMapper::Resource

  property :id, Serial
  property :item_name, String, required: true

  belongs_to :list

end