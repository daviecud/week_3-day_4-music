require ('pg')
require_relative('./albums.rb')
require_relative('./collector.rb')

class Collector

  attr_reader :id, :name
  

def initialize(options)
  @id = options['id'].to_i if options['id']
  @name = options['name']
end

def save()
  db = PG.connect({dbname: 'music_colection', host: 'localhost'})
  sql = "INSERT INTO collector (
  name
  ) VALUES ($1)
  RETURNING id"
  values = [@name]
  db.prepare("save", sql)
  result = db.exec_prepared("save", values)
  db.close
  @id = result[0]['id'].to_i
end

def self.delete_all()
  db = PG.connect({dbname: 'music_colection', host: 'localhost'})
  sql = "DELETE FROM collector"
  db.prepare("delete_all", sql)
  db.exec_prepared("delete_all")
  db.close
end

def self.update()
  db = PG.connect({dbname: 'music_colection', host: 'localhost'})
  sql = "UPDATE collectors SET (
    name
    ) = ($1)
  WHERE id = $2"
  values = [@name, @id]
  db.prepare("update", sql)
  db.exec_prepared("update", values)
  db.close()
end

end
