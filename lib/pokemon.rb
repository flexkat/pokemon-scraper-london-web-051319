class Pokemon

  attr_accessor :name, :type, :db, :id, :hp
  # attr_reader id

  def initialize(id: nil, name:, type:, db:, hp: 60)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end 

  def self.save(name, type, db)
    sql = 'INSERT INTO pokemon (name, type) VALUES (?, ?)'
    db.execute(sql, name, type)
    @id = db.execute('SELECT last_insert_rowid() FROM pokemon')[0][0]
  end

  def self.find(id, db)
    sql = 'SELECT * FROM pokemon WHERE id = ?'
    result = db.execute(sql, id)[0]
    result.flatten
    Pokemon.new(id: result[0], name: result[1], type: result[2], db: db, hp: result[3])
  end 

  def alter_hp(hp, db)
    sql = 'UPDATE pokemon SET hp = ? WHERE id = ?;'
    db.execute(sql, hp, self.id)
  end
end
