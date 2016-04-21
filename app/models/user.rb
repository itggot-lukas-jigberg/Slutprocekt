class User

  property :id, Serial
  property :username, String, unique: true, required: true
  property :password, String, unique: true, required: true
  property :mail, String, unique: true, required: true
end