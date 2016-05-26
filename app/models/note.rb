class Note
  include DataMapper::Resource

  property :id, Serial
  property :titel, String, required: true
  property :info, Text
  property :time_stamp, DateTime #, required: true
  #fixa

  belongs_to :user #required
end