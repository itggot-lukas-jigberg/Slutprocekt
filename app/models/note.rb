class Note
  include DataMapper::Resource

  property :id, Serial
  property :titel, String, required: true
  property :info, Text
  property :created_at, DateTime, required: true
  #fixa

  belongs_to :user #required
end