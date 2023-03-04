
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
  logo: "https://upload.wikimedia.org/wikipedia/commons/6/6b/Tresor-Logo.svg",
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
  logo: "https://upload.wikimedia.org/wikipedia/commons/1/11/Berghain-Logo.svg",
  image_url: "https://images.unsplash.com/photo-1574391884720-bbc3740c59d1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80"
)

Venue.create!(
  name: "Sisyphus",
  definition: "The Sisyphus is a techno club in Berlin-Rummelsburg.
                It is operated in a former dog biscuit factory and, according to Resident Advisor magazine,
                is one of the ten most important clubs in Berlin for electronic dance music.",
  address: "Hauptstrasse 15, 10317 Berlin",
  logo: "https://www.google.com/search?q=sisyphos%20logo&tbm=isch&cs=1&hl=de&sa=X&ved=0CB4QtI8BKABqFwoTCJiN8pT3uP0CFQAAAAAdAAAAABAp&biw=1680&bih=914&dpr=2#imgrc=C1_mGc5T5IzGmM",
  image_url: "https://images.unsplash.com/photo-1572088509226-03c7c57c1bf5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1335&q=80"
)

Venue.create!(
  name: "About Blank",
  definition: "About Blank is a techno club in the Friedrichshain district of Berlin.",
  address: "Markgrafendamm 24c, 10245 Berlin",
  logo: "https://unsplash.com/photos/HFqDtoH36Gs",
  image_url: "https://images.unsplash.com/photo-1555086156-e6c7353d283f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80"
)

Venue.create!(
  name: "Anomalie Art Club",
  definition: "Come for the clubbing, and stay for the art:
                Anomalie Art Club is home to some of the most spectacular visual designs on Berlin’s club scene. Over the past two years,
                this place has played host to techno DJs from around the world, alongside artists working in sound, light, and installation.
                Anomalie also hosts film screenings, art exhibitions, and open-air raves.",
  address: "Storkower Str. 123, 10407 Berlin",
  logo: "https://www.facebook.com/photo/?fbid=204824975240803&set=a.201155812274386",
  image_url: "https://images.unsplash.com/photo-1606565471405-f4e6e7b4f2ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1000&q=80"
)

Venue.create!(
  name: "Loophole Berlin",
  definition: "Decadent and trashy in equal measures, this ruin-esque former brothel attracts both glitter punks and health goths, who sway
                to experimental electronic music, down cheap beers and soak up the laid-back vibes.",
  address: "Boddinstraße 60, 12053 Berlin",
  logo: "https://unsplash.com/photos/uylviI4RJpY",
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
  logo: "https://www.facebook.com/photo/?fbid=203255388721352&set=a.203255352054689",
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
  logo: "https://www.facebook.com/photo/?fbid=567121732114303&set=a.567121735447636"
)

Venue.create!(
  name: "Club De Visionaere",
  definition: "One of the first and best, this summer-only canal-side club is nestled under an enormous weeping willow.
                There’s a small indoor dance floor and a rickety open-air wood-deck terrace with a large jetty stretching out across the
                water. You can drop in during the week for a beer, but the place comes to life at the weekend, filling up with an
                after-hours crowd, happy to chill, drink and dance the day away. Winter parties are now held in the nearby Hoppetosse
                boat at Arena Berlin.",
  address: "Am Flutgraben 1, 12435 Berlin",
  logo: "https://www.facebook.com/photo/?fbid=473033608185387&set=a.473033578185390&locale=de_DE",
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
  logo: "https://www.pngwing.com/en/free-png-xfhco",
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
    venue_id: Venue.all.sample.id

  )
  event.save!
end

puts "created #{Event.count} events"

puts "DATABASE SUCCESSFULL SEEDED"
