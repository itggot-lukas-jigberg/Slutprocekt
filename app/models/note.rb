class Note
  include DataMapper::Resource

  property :id, Serial
  property :titel, String, required: true
  property :info, Text
  property :created_at, DateTime, required: true
  belongs_to :user
end