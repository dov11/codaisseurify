Picture.destroy_all
Song.destroy_all
Artist.destroy_all

alphaville = Artist.create!(name: "Alphaville", active_since: DateTime.new(1982))
nightranger = Artist.create!(name: "Night Ranger", active_since: DateTime.new(1979))
immortal = Artist.create!(name: "Immortal", active_since: DateTime.new(1991))
timecop = Artist.create!(name: "Timecop1983", active_since: DateTime.new(2014))
cure = Artist.create!(name: "The Cure", active_since: DateTime.new(1976))

forever_young = Song.create!(name: "Forever young", release_date: DateTime.new(1984, 9), length: 224, artist: alphaville)
forever_young = Song.create!(name: "Dance with me", release_date: DateTime.new(1986, 3), length: 248, artist: alphaville)
sister = Song.create!(name: "Sister Christian", release_date: DateTime.new(1984, 6), length: 302, artist: nightranger)
goodbye = Song.create!(name: "Goodbye", release_date: DateTime.new(1985, 2), length: 280, artist: nightranger)
forest = Song.create!(name: "A forest", release_date: DateTime.new(1980, 4), length: 355, artist: cure)
pics = Song.create!(name: "Pictures of you", release_date: DateTime.new(1990, 3), length: 479, artist: cure)

picture_alp = Picture.create!(remote_image_url_url: "http://res.cloudinary.com/dov11/image/upload/v1510411635/220px-Alphavilleforeveryoung_t65xap.jpg", description: "Cover art for the album Forever Young by the artist Alphaville. The cover art copyright is believed to belong to the label, Warner, Atlantic, or the graphic artist(s)", artist: alphaville)
picture_night = Picture.create!(remote_image_url_url: "http://res.cloudinary.com/dov11/image/upload/v1510412080/220px-Midnightranger_gu1oii.jpg", description: "This is the cover art for Midnight Madness (album). The cover art copyright is believed to belong to the record label or the graphic artist(s)", artist: nightranger)
picture_time = Picture.create!(remote_image_url_url: "http://res.cloudinary.com/dov11/image/upload/v1510412524/Timecop1983_qwm3pk.jpg", artist: timecop)
picture_imm = Picture.create!(remote_image_url_url: "http://res.cloudinary.com/dov11/image/upload/v1510412381/Battles_In_The_North_phg0dz.jpg", artist: immortal)
picture_cure = Picture.create!(remote_image_url_url: "http://res.cloudinary.com/dov11/image/upload/v1510412840/320px-The_Cure_Live_in_Singapore_2-_1st_August_2007_q6s2vk.jpg", artist: cure)
