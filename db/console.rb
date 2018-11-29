require ('pry')
require_relative('../models/collector.rb')
require_relative('../models/albums.rb')

collector1 = Collector.new({'name' => 'JimBob'})
collector1.save

album1 = Albums.new({
  'title' => 'Aretha Sings the Blues',
  'genre' => 'Blues',
  'collector_id' => collector1
  });

  album1.save()

  binding.pry
  nil

# collector = Collector.new({
#     'collector_id' => collector.id
#     });
