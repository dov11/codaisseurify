Song.destroy_all
Artist.destroy_all

alphaville = Artist.create!(name: "Alphaville", active_since: DateTime.new(1982))
nightranger = Artist.create!(name: "Night Ranger", active_since: DateTime.new(1979))
immortal = Artist.create!(name: "Immortal", active_since: DateTime.new(1991))
timecop = Artist.create!(name: "Timecop1983", active_since: DateTime.new(2014))
cure = Artist.create!(name: "The Cure", active_since: DateTime.new(1976))

forever_young = Song.create(name: "Forever young", release_date: DateTime.new(1984, 9), length: 224, artist: alphaville)
forever_young = Song.create(name: "Dance with me", release_date: DateTime.new(1986, 3), length: 248, artist: alphaville)
sister = Song.create(name: "Sister Christian", release_date: DateTime.new(1984, 6), length: 302, artist: nightranger)
goodbye = Song.create(name: "Goodbye", release_date: DateTime.new(1985, 2), length: 280, artist: nightranger)
forest = Song.create(name: "A forest", release_date: DateTime.new(1980, 4), length: 355, artist: cure)
pictures = Song.create(name: "Pictures of you", release_date: DateTime.new(1990, 3), length: 479, artist: cure)
