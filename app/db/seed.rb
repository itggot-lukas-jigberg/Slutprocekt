class Seeder

  def self.seed!
    users
    notes
  end

  def self.users
    User.create(username: 'EnergyPixel', password: 'PontusPT', mail: 'grillkorv.super@gmail.com')
  end

  def self.notes
    Note.create(titel: 'Köpa Kazoo', info: 'ville tycker att han ska köpa en kazo på torget', user_id: 1 )
  end

end