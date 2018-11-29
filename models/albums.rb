require('pg')

class Albums

  attr_reader :title, :genre
  attr_accessor :id

def initialize(options)
  @title = options['title']
  @genre = options['genre']
  @collector_id = options['collector_id']
end

def save()
    db = PG.connect({dbname: 'music_colection', host: 'localhost'})
    sql = "INSERT INTO albums (
    title, genre
    ) VALUES ($1, $2)"
    values = [@title, @genre]
    db.prepare("save", sql)
    result = db.exec_prepared("save", values)
    db.close
end

end
