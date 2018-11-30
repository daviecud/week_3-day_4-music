require ('pry')
require_relative('../models/collector.rb')
require_relative('../models/albums.rb')
require_relative('../models/artists.rb')

Collector.delete_all
Albums.delete_all
Artists.delete_all

collector1 = Collector.new({'name' => 'JimBob'});
collector2 = Collector.new({'name' => 'Ally'});
collector1.save
collector2.save

album1 = Albums.new({
  'collector_id' => collector1.id,
  'title' => 'Aretha Sings the Blues',
  'genre' => 'Blues'

  });

  album1.save()

album2 = Albums.new({
  'collector_id' => collector2.id,
  'title' => 'Get Yer Ya Ya\'s Out',
  'genre' => 'Rock \'n\' Roll'


  });

  album2.save()

artist1 = Artists.new({
  'name' => 'Bob Dylan'

  })

artist1.save()

artist2 = Artists.new({
  'name' => 'Aretha Franklin'

  })

artist2.save()

artist3 = Artists.new({
  'name' => 'The Rolling Stones'

  })

  artist3.save()

  binding.pry
  nil
