puts "deleting all lineups"
Lineup.all.delete_all

puts "deleting all artists"
Artist.all.delete_all

puts "deleting all rsvsp"
Rsvp.all.delete_all

puts "deleting all Events from the database"
Event.all.delete_all

puts "deleting all users from the database"
User.all.delete_all

puts "deleting all Venues from the database"
Venue.all.delete_all

puts "Seeding Database"

puts "Seeding Users"

User.create!(
  email: "user@user.com",
  password: 123456,
  full_name: "user user",
  avatar_url: "https://unsplash.com/s/photos/face",
  address: "Hauptstrasse 15, 10317 Berlin"
)

10.times do
  user = User.new(
    full_name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 123456,
    avatar_url: "https://unsplash.com/s/photos/face",
    address: "Köpenicker Str. 70, 10179 Berlin"
  )
  user.save!
end

puts "created #{User.count} users"

puts "Seeding venues"

status = %w[cold, warm, hot, offline]

Venue.create!(
  name: "Tresor",
  definition: "The club was founded in March 1991 in the vaults of the former department store Wertheim at Leipziger Strasse 126-128 in Mitte,
                the central part of East Berlin, next to the Potsdamer Platz.
                The history of the club goes back to 1988 when the electronic music label Interfisch opened the Ufo Club in Berlin.
                Ufo was the original centre of Berlin house and techno, but due to financial problems that club closed in 1990.",
  address: "Köpenicker Str. 70, 10179 Berlin",
  logo: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Tresor-Logo.svg/1200px-Tresor-Logo.png",
  image_url: "https://images.unsplash.com/photo-1630395822970-acd6a691d97e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80"
)

Venue.create!(
  name: "Berghain",
  definition: "Berghain is a nightclub in Berlin, Germany.
                It is named after its location near the border between Kreuzberg and Friedrichshain in Berlin,
                and is a short walk from Berlin Ostbahnhof main line railway station.
                Founded in 2004 by friends Norbert Thormann and Michael Teufele,
                it has since become one of the world's most famous clubs,
                and has been called the world capital of techno.",
  address: "Am Wriezener Bahnhof, 10243 Berlin, Germany",
  logo: "https://images.ra.co/f877a84647798facc1caf0ecd16fb9cd253ced60.jpg",
  image_url: "https://images.unsplash.com/photo-1574391884720-bbc3740c59d1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80"
)

Venue.create!(
  name: "Sisyphus",
  definition: "The Sisyphus is a techno club in Berlin-Rummelsburg.
                It is operated in a former dog biscuit factory and, according to Resident Advisor magazine,
                is one of the ten most important clubs in Berlin for electronic dance music.",
  address: "Hauptstrasse 15, 10317 Berlin",
  logo: "https://static.ra.co/images/clubs/de-sisyphos.jpg",
  image_url: "https://images.unsplash.com/photo-1572088509226-03c7c57c1bf5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1335&q=80"
)

Venue.create!(
  name: "About Blank",
  definition: "About Blank is a techno club in the Friedrichshain district of Berlin.",
  address: "Markgrafendamm 24c, 10245 Berlin",
  logo: "https://images.xceed.me/clubs/logos/about-blank-club-berlin-xceed-logo-4d1e.png",
  image_url: "https://images.unsplash.com/photo-1555086156-e6c7353d283f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80"
)

Venue.create!(
  name: "Anomalie Art Club",
  definition: "Come for the clubbing, and stay for the art:
                Anomalie Art Club is home to some of the most spectacular visual designs on Berlin’s club scene. Over the past two years,
                this place has played host to techno DJs from around the world, alongside artists working in sound, light, and installation.
                Anomalie also hosts film screenings, art exhibitions, and open-air raves.",
  address: "Storkower Str. 123, 10407 Berlin",
  logo: "https://cdn.artconnect.com/pictures/13470/image_list.jpg",
  image_url: "https://images.unsplash.com/photo-1606565471405-f4e6e7b4f2ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=80"
)

Venue.create!(
  name: "Loophole Berlin",
  definition: "Decadent and trashy in equal measures, this ruin-esque former brothel attracts both glitter punks and health goths, who sway
                to experimental electronic music, down cheap beers and soak up the laid-back vibes.",
  address: "Boddinstraße 60, 12053 Berlin",
  logo: "https://www.digitalinberlin.de/wordpress/wp-content/2014/02/loophole.jpg",
  image_url: "https://images.unsplash.com/photo-1541057591728-77510a9ea77f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80"
)

Venue.create!(
  name: "Kater Blau",
  definition: "This is the X-rated part of the expansive, family-friendly Holzmarkt development. With a moored boat,
                a roaring fire at night and many hammock-like features, the potential for alfresco relaxation is high. Meanwhile,
                a fine roster of electronic DJs spins away unendingly – sometimes for four days straight. The vibe is more crusty than chic,
                and increasingly so as the weekend unravels. If you have the stamina (and courage) to last well into Monday afternoon,
                expect to encounter some of Berlin’s strangest creatures.",
  address: "Holzmarktstraße 25, 10243 Berlin",
  logo: "https://images.xceed.me/clubs/logos/kater-blau-club-berlin-xceed-logo-76de.png",
  image_url: "https://images.unsplash.com/photo-1544586784-b9ee32edb3ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80"
)

Venue.create!(
  name: "YAAM",
  definition: "Yet another victim of Berlin’s Mediaspree development,
                YAAM was forcibly evicted from its previous home – but you can’t keep a good reggae club down.
                It quickly found another riverside spot, so it’s business as usual for this legendary beach bar and cultural centre.
                By day, there might be kids playing a laid-back game of volleyball, with a jerk chicken stall on the side.
                Then, as the light fades, things keep up a leisurely pace with concerts and parties bouncing to an Afro-Caribbean beat.",
  address: "Schillingbrücke 3, 10243 Berlin",
  logo: "https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F398477219%2F168589441633%2F1%2Foriginal.20221123-004715?w=369&auto=format%2Ccompress&q=75&sharp=10&rect=5%2C0%2C369%2C369&s=b891db8c21c75e65ca5cc83b410250b1",
  image_url: "https://images.unsplash.com/photo-1526309789204-a67df3fd3c4c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1365&q=80"
)

Venue.create!(
  name: "Club der Visionaere",
  definition: "One of the first and best, this summer-only canal-side club is nestled under an enormous weeping willow.
                There’s a small indoor dance floor and a rickety open-air wood-deck terrace with a large jetty stretching out across the
                water. You can drop in during the week for a beer, but the place comes to life at the weekend, filling up with an
                after-hours crowd, happy to chill, drink and dance the day away. Winter parties are now held in the nearby Hoppetosse
                boat at Arena Berlin.",
  address: "Am Flutgraben 1, 12435 Berlin",
  logo: "https://static.ra.co/images/clubs/de-berlin-club-der-visionaere.jpg?dateUpdated=1610212437520",
  image_url: "https://images.unsplash.com/photo-1551081831-02459886c4c6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80"
)

Venue.create!(
  name: "Ritter Butzke",
  definition: "This enormous old factory has become a party hotspot thanks to its imaginative décor and reliable booking policy;
                events include the hedonistic GMF party series and other techno-centric offerings.
                Ritter Butzke held illegal parties for years but has now gone legit and even allows its parties to be promoted in listings
                mags from time to time. It’s the antithesis of Berghain, with crowds of locals and amiable bouncers who are occasionally
                dressed as knights (Ritter means ‘knight’). Brace yourself for a massive queue if you arrive between 1am and 3:30am.",
  address: "Ritterstraße 24-27, 10969 Berlin",
  logo: "https://cdn.evntsvc.net/r/l/location_577df018-e75b-4e0c-a013-9002adf4b42c_medium.png",
  image_url: "https://images.unsplash.com/photo-1574391884720-bbc3740c59d1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80"
)

puts "done seeding #{Venue.count} venues"

puts "preparing seeding events"



50.times do
  event = Event.new(

    title: Faker::Fantasy::Tolkien.poem,
    description: Faker::Quote.famous_last_words,
    status: status.sample,
    category: "party",
    capacity: rand(100..1200),
    dresscode: "naked",
    start_date: DateTime.now + rand(10).day + rand(10).hours,
    end_date: DateTime.now + rand(20..30).day + rand(20).hours,
    user_id: User.all.sample.id,
    venue_id: Venue.all.sample.id,
    image_url: "https://source.unsplash.com/random?party"

  )
  event.save!
end

puts "created #{Event.count} events"


# 20.times do
#   Artist.create!(
#     name: Faker::Music.band,
#     about: Faker::Quote.famous_last_words,
#     genre: Faker::Music.genre,
#     link: "https://soundcloud.com/woym",
#     image_url: "https://cdn.prod.www.spiegel.de/images/a71d32b1-de0a-495d-b615-8872ed34faf0_w948_r1.778_fpx50_fpy48.webp"
#   )
# end
artist1 = Artist.create!(
  name: "Lady Gaga",
  about: "Stefani Joanne Angelina Germanotta
  (born March 28, 1986), known professionally as Lady Gaga,
  is an American singer, songwriter, and actress. She is known for her image reinventions and musical versatility.",
  genre: "Pop",
  link: "https://www.youtube.com/channel/UCNL1ZadSjHpjm4q9j2sVtOA",
  image_url: "https://cdn.prod.www.spiegel.de/images/a71d32b1-de0a-495d-b615-8872ed34faf0_w948_r1.778_fpx50_fpy48.webp"
)

artist2 = Artist.create!(
  name: "Tame Impala",
  about: "Tame Impala is the psychedelic music project of Australian multi-instrumentalist Kevin Parker.[6] In the recording studio, Parker writes, records, performs, and produces all of the project's music.",
  genre: "Psychedelic Rock",
  link: "https://www.youtube.com/user/tameimpalamusic",
  image_url: "https://www.laut.de/Tame-Impala/tame-impala-207454.jpg"
)

artist3 = Artist.create!(
  name: "RÜFÜS DU SOL",
  about: "RÜFÜS DU SOL and formerly known as simply Rüfüs from 2010 to 2018 is an Australian alternative dance group from Sydney, that consists of Tyrone Lindqvist, Jon George and James Hunt.",
  genre: "Alternative Dance",
  link: "https://www.youtube.com/user/monekeleon",
  image_url: "https://www.billboard.com/wp-content/uploads/2022/10/rufus-du-sol-portrait-grammys-billboard-1548.jpg?w=942&h=623&crop=1"
)

artist4 = Artist.create!(
  name: "Peggy Gou",
  about: "Peggy Gou is a South Korean DJ and record producer based in Germany. She has released seven EPs on record labels including Ninja Tune and Phonica.",
  genre: "Deep House",
  link: "https://www.youtube.com/channel/UCWd5yMFDEuSCWzTM4xuA1fg",
  image_url: "https://weraveyou.com/wp-content/uploads/2022/06/Peggy-Gou-Press.jpg"
)

artist5 = Artist.create!(
  name: "Rossi.",
  about: "Rossi. is an exiting young producer, who is making a name for himself with his new fresh cut sounds.
  ‘Rossi.’s sets are inspired by the ever-growing ‘minimal groove scene’, in Europe. He plays music with the aim of lifting a crowd, his sets will feature lots of cuts, hats and percussion which is stripped down on-top of jazzy and soulful basslines.",
  genre: "Minimal Groove",
  link: "https://soundcloud.com/modula-records/mr001-b2-rkinn-clip",
  image_url: "https://scontent-ber1-1.xx.fbcdn.net/v/t39.30808-6/293336527_451780400290680_3314608451497244126_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=-ErZF2FhyDMAX9LqP8x&_nc_ht=scontent-ber1-1.xx&oh=00_AfAI-cKINA_ruqgPFP_RM1tujCpU_SoTpZwXRZto1y7APg&oe=640F360B"
)

artist6 = Artist.create!(
  name: "Purple Disco Machine",
  about: "The sound of Purple Disco Machine describe some as 'Deep Funk'. In 2009 the project Purple Disco Machine was founded. In recent years, PDM composed many songs, including, 'My House', which was published by Off Recordings.",
  genre: "Deep Funk",
  link: "https://www.youtube.com/channel/UCdkMBTZmOXDh8nTSX1RdRkA",
  image_url:"https://yt3.googleusercontent.com/CJ0UQGEIXyr3uz8sqeLM1O00ty0l6iRyhM3jEjmF5zN-Mmk53y3oMm6eQv3kz_Tr62uKagIJw8E=s176-c-k-c0x00ffffff-no-rj"
)

artist7 = Artist.create!(
  name: "Mirco Caruso",
  about: "Haste makes waste. You may describe Mirco Caruso’s previous career with these three words and it will fit perfectly. This club-musician with Italian roots doesn’t work with a prybar, he doesn’t care for exclusive hypes and he sure is no bandwagoner. Mirco Caruso’s career is embossed by a constant buildup that finally brought him to the musical genre he belongs to.",
  genre: "Dance/Eletronica",
  link: "https://www.youtube.com/channel/UCAWgieZ7upNJRpFPdrsvdrA",
  image_url: "https://geo-media.beatport.com/image_size/590x404/3ca2dd94-0307-475c-a97b-8f192c4b3a48.jpg"
)

puts "created #{Artist.count} artists"

20.times do
  Lineup.create!(
    artist_id: Artist.all.sample.id,
    event_id: Event.all.sample.id
  )
end

puts "created #{Lineup.count} lineups"


puts "DATABASE SUCCESSFULL SEEDED"
