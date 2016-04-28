class Datetime
  include DataMapper::Resource

  property :id, Serial
  property :date_stamp, DateTime, required: true
  #belongs_to :note
end