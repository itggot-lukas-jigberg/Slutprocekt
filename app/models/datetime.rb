class Datetime

  property :id, Serial
  property :settime, DataTime, required: true
  property :time, Time, required: true
end