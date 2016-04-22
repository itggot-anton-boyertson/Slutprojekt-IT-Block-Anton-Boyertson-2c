class User
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String, required: true
  property :last_name, String, required: true
  property :username, String, required: true, unique: true
  property :mobil, String, required: true
  property :password, String, required: true
  property :e_mail_address, String, required: true, unique: true

  has n, :user_lists
  has n, :lists, :through => :user_lists

end