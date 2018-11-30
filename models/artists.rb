require ('pg')
require_relative('./albums.rb')


class Artists

  attr_reader :id
  attr_accessor :name

def initialize(options)
  @id = options['id'].to_i if options['id']
  @name = options['name']
end

def save()
  db = PG.connect({dbname: 'music_colection', host: 'localhost'})
  sql = "INSERT INTO artists (
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
  sql = "DELETE FROM artists"
  db.prepare("delete_all", sql)
  db.exec_prepared("delete_all")
  db.close
end


end
