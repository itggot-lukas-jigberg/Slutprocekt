class Seeder

  def self.seed!
    users
    notes
  end

  def self.users
    User.create(username: 'EnergyPixel', password: 'PontusPT', mail: 'grillkorv.super@gmail.com')
  end

  def self.notes
    Note.create(titel: 'Köpa Kazoo', info: 'ville tycker att han ska köpa en kazo på torget', time_stamp: '2016,7,4',user_id: 1)
    Note.create(titel: 'ÄtaMat', info: 'Gå och äta', time_stamp: '2001,3,16', user_id: 1)
    Note.create(titel: 'Buggfix', info: 'När man isg uppar så directas man till / istället för att koden på app som gör att man inte kan fuska sig in funkar för linkar också', time_stamp: '2016,5,31', user_id: 1)
    Note.create(titel: 'Betygsunderlag', info: 'Fråga Daniel var man hittar dem', time_stamp: '2016,5,31', user_id: 1)
  end

  def self.datetime
    Datetime.create(date_stamp: '')
  end

end