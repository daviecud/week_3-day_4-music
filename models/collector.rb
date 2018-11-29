require ('pg')

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
  ) VALUES ($1)"
  values = [@name]
  db.prepare("save", sql)
  result = db.exec_prepared("save", values)
  db.close
  # @id = result[0]['id'].to_i
end



end
