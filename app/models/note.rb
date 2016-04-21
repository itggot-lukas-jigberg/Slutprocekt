class Note
  include DataMapper::Resource

  property :id, Serial
  property :titel, String, required: true
  property :info, Text
  property :birthday, DataTime, required: true
  property :creator, String, required: true
end