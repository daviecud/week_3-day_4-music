require('pg')
require_relative('./collector.rb')

class Albums

  attr_reader :title, :genre, :collector_id

def initialize(options)
  @id = options['id'].to_i if options['id']
  @title = options['title']
  @genre = options['genre']
  @collector_id = options['collector_id'].to_i
end

def save()
    db = PG.connect({dbname: 'music_colection', host: 'localhost'})
    sql = "INSERT INTO albums (
    title, genre, collector_id
    ) VALUES ($1, $2, $3)
    RETURNING id"
    values = [@title, @genre, @customer_id]
    db.prepare("save", sql)
    result = db.exec_prepared("save", values)
    db.close
    @id = result[0]['id'].to_i
end

def self.delete_all()
  db = PG.connect({dbname: 'music_colection', host: 'localhost'})
  sql = "DELETE FROM albums"
  db.prepare("delete_all", sql)
  db.exec_prepared("delete_all")
  db.close
end

end
