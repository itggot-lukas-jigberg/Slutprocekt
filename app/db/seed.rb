class Seeder

  def self.seed!
    users
    notes
  end

  def self.users
    User.create(username: 'EnergyPixel', password: 'PontusPT', mail: 'grillkorv.super@gmail.com')
    User.create(username: 'DanielBerg', password: 'Grillkorv', mail: 'daniel.berg1@itggot.se')
  end

  def self.notes
    Note.create(titel: 'Köpa Kazoo', info: 'ville tycker att han ska köpa en kazo på torget', time_stamp: '2016,7,4',user_id: 1)
    Note.create(titel: 'ÄtaMat', info: 'Gå och äta', time_stamp: '2001,3,16', user_id: 1)
    Note.create(titel: 'Sätta Betyg', info: 'Måste ge alla elever betyg', time_stamp: '2016,6,05', user_id: 2)
    Note.create(titel: 'Behöver en grönsak', info: 'Måste hitta en grönsak', time_stamp: '2016,6,12', user_id: 2)
  end

end