class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, unique: true, required: true, length: 6..16
  property :password, BCryptHash, required: true
  property :mail, String, unique: true, required: true

  has n, :notes
end