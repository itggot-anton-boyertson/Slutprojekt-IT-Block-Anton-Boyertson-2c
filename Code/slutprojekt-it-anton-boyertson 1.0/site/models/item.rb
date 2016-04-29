class Item
  include DataMapper::Resource

  property :id, Serial
  property :item_name, String, required: true
  property :item_description, String

  belongs_to :list

end