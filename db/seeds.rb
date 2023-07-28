require "open-uri"
Event.all.each do |event|
  event.photo.purge
end

puts "deleting photos of events in cloudnary"

# puts "deleting all messages"
# Message.all.delete_all

# puts "deleting all chatrooms"
# Chatroom.all.delete_all

puts "deleting all lineups"
Lineup.all.delete_all

puts "deleting all artists"
Artist.all.delete_all

puts "deleting all rsvsp"
Rsvp.all.delete_all

puts "deleting all Events from the database"
Event.all.destroy_all

User.all.each do |user|
  user.photo.purge
end

puts "deleting all photos of users in cloudnary"

puts "deleting all users from the database"
User.all.delete_all

puts "deleting all Venues from the database"
Venue.all.delete_all

puts "Seeding Database"

puts "Seeding Users"

mainuser = User.create!(
  email: "user@user.com",
  password: 123456,
  nickname: Faker::Name.first_name,
  bio: Faker::Quote.jack_handey,
  full_name: "Max Mustermann",
  address: "Rudi-Dutschke-Strasse 26, 10969 Berlin"
)
file = URI.open("https://source.unsplash.com/random?face")
mainuser.photo.attach(io: file, filename: mainuser.full_name, content_type: "image/jpg")
mainuser.save!

120.times do
  user = User.new(
    full_name: Faker::Name.name,
    email: Faker::Internet.email,
    nickname: Faker::Name.first_name,
    bio: Faker::Quote.jack_handey,
    password: 123456,
    address: "Köpenicker Str. 70, 10179 Berlin"
  )
  file = URI.open("https://source.unsplash.com/random?face")
  user.save!
  user.photo.attach(io: file, filename: user.full_name, content_type: "image/jpg")
end

puts "created #{User.count} users"

puts "Seeding venues"

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
Venue.create!(
  name: "RSO.BERLIN",
  definition: "Griessmuehle moves southeast.
                From now, we are to be found with new beer garden
                and open-air area on the former Bärenquell brewery in Berlin-Niederschöneweide.
                Neither the closure of Griessmuehle, nor the numerous arduous removals and relocations could get us down.
                We are back—in the old manner, at a new location.",
  address: "Schnellerstrasse 137, 12439 Berlin",
  logo: "https://cdn.evntsvc.net/r/l/location_577df018-e75b-4e0c-a013-9002adf4b42c_medium.png",
  image_url: "https://images.unsplash.com/photo-1544392667-d6cc76633537?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"
)

Venue.create!(
  name: "Club OST",
  definition: "Club OST, nestled between Osthafen and Ostkreuz, consciously focuses on musical gems with warm sounds from Berlin and the celestial planes.",
  address: "Alt-Stralau, 1-2 Friedrichshain 10245",
  logo: "https://imgproxy.ra.co/_/quality:66/h:180/w:180/extend:1/rt:fill/enlarge:1/aHR0cHM6Ly9zdGF0aWMucmEuY28vaW1hZ2VzL2NsdWJzL2xvZ28ucG5nP2RhdGVVcGRhdGVkPTE2NzY5ODc5MzY1OTM=",
  image_url: "https://images.unsplash.com/photo-1514525253161-7a46d19cd819?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1674&q=80"
)

Venue.create!(
  name: "Zenner",
  definition: "Located in the middle of Treptower Park, Zenner is a young venue for a creative exchange of local international artists, the finest in electronic music, and outstanding concerts.
              Risen from the ashes of a former GDR restaurant, disco Eierschale, and Burger King, and in a neoclassical building, Zenner has two floors and a huge outdoor area to hang out.",
  address: "Alt-Treptow 15, 12435 Berlin",
  logo: "https://www.zenner.berlin/assets/images/zenner-logo-home.png",
  image_url: "https://images.unsplash.com/photo-1550218585-5a4e6bc59ebb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80"
)

Venue.create!(
  name: "Trauma Bar und Kino",
  definition: "New cultural space for dance, video art and cinematography.",
  address: "Heidestrasse 50, 10557 Berlin",
  logo: "https://imgproxy.ra.co/_/quality:66/h:180/w:180/extend:1/rt:fill/enlarge:1/aHR0cHM6Ly9zdGF0aWMucmEuY28vaW1hZ2VzL2NsdWJzL2RlLXRyYXVtYWJhci5qcGc_ZGF0ZVVwZGF0ZWQ9MTY2NzkyNjcyNzQzMw==",
  image_url: "https://images.unsplash.com/photo-1596131397999-bb01560efcae?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1674&q=80"
)

Venue.create!(
  name:
  "M-BIA",
  definition:
  "Moody, industrial nightclub with exposed-brick walls & neon decor, hosting electronic music nights.",
  address:
  "Dircksenstr. 123, 10178 Berlin",
  logo:
  "https://imgproxy.ra.co/_/quality:66/h:180/w:180/extend:1/rt:fill/enlarge:1/aHR0cHM6Ly9zdGF0aWMucmEuY28vaW1hZ2VzL2NsdWJzL2RlLW1iaWEuanBnP2RhdGVVcGRhdGVkPTE2NzQxMzE4MjcxMTc=",
  image_url:
  "https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9zdGF0aWMucmEuY28vaW1hZ2VzL2NsdWJzL2xnL2RlLW0tYmlhYmVybGluLmpwZz9kYXRlVXBkYXRlZD0xNjc0MTMxODI3MTE3"
)

Venue.create!(
  name:
  "Suicide Club",
  definition:
  "The Suicide Club (fka Suicide Circus) is one of the most traditional and established techno clubs in Berlin, with a
  large dance floor in the centre, an open-air floor, cutting-edge electronic music and a cosy outdoor terrace/beer garden.
  The club has everything you need for a perfect techno night: reduced exterior, dark corners, fog machine, industrial-style dance floor, mystical lighting and a fat sound system.
  The name of the club 'Suicide' refers to the band 'Suicide', which paved the way for later minimal techno back in the
  70s with synthesizers and drum computers.",
  address:
  "Revaler Strasse, 99 10245 Berlin",
  logo:
  "https://imgproxy.ra.co/_/quality:66/h:180/w:180/extend:1/rt:fill/enlarge:1/aHR0cHM6Ly9zdGF0aWMucmEuY28vaW1hZ2VzL2NsdWJzL2xvZ29yZTIuanBnP2RhdGVVcGRhdGVkPTE2NDg1NjA0MzI4NDM=",
  image_url:
  "https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9zdGF0aWMucmEuY28vaW1hZ2VzL2NsdWJzL2xnL2RlLXN1aWNpZGUtY2lyY3VzLWJlcmxpbi5qcGc_ZGF0ZVVwZGF0ZWQ9MTY0ODU2MDQzMjg0Mw=="
)

Venue.create!(
  name:
  "Renate",
  definition:
  "Born from an unrenovated apartment building in Friedrichshain, across the river from Treptower Park.
  Salon Zur Wilden Renate has three main dance floors: Schwarzer Raum on the ground floor, mainly focussing on techno. Then upstairs there is Grüner Raum where it’s all about house, and Roter Raum for all things slow, weird and trippy disco. The atmosphere is that of a theatrical house party. The booking is a mixture of international and local artists.
  A large outdoor courtyard is open during the summer, which provides another bar with food and plenty of space to hang out.",
  address: "Alt Stralau, 70 10245 Berlin",
  logo:
  "https://imgproxy.ra.co/_/quality:66/h:180/w:180/extend:1/rt:fill/enlarge:1/aHR0cHM6Ly9zdGF0aWMucmEuY28vaW1hZ2VzL2NsdWJzLzI3OTQ3NDk2NF83OTY1MTU2MTIwMTkyNjEzXzEwNTQxMDA5NjE2NTg0OTA5MDdfbi0yLmpwZWc_ZGF0ZVVwZGF0ZWQ9MTY2MzY5Mjc1NzU5MA==",
  image_url:
  "https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9zdGF0aWMucmEuY28vaW1hZ2VzL2NsdWJzL2xnL3JlbmF0ZS5qcGc_ZGF0ZVVwZGF0ZWQ9MTY2MzY5Mjc1NzU5MA=="
)

Venue.create!(
  name:
  "Hoppetosse",
  definition:
  "Hoppetosse is the on-water sister venue to the well-known Club der Visionäre. It's a permanently docked boat (dubbed MS Hoppetosse), located on the Spree not far from Arena Club. There's usually one dance floor—surrounded by crystal-clear Morf speakers from Mo Stern—in action at parties, which usually take place on the weekends. Like its smaller neighbour, Hoppetosse's booking policy focusses on minimalist house and techno, delivered by a combination of local favourites and a rotating cast of the style's key names.",
  address:
  "Eichenstrasse, 4 12435 Berlin",
  logo:
  "https://hoppetosse.berlin/wp-content/themes/hoppetosse/img/hoppetosse-logo.png",
  image_url:
  "https://images.unsplash.com/photo-1549873836-765d3157c324?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80"
)

Venue.create!(
  name:
  "OXI",
  definition:
  "Sitting, drinking & music at a distance. No more and no less.",
  address:
  "Wiesenweg, 1-4, 10365 Berlin",
  logo:
  "https://imgproxy.ra.co/_/quality:66/h:180/w:180/extend:1/rt:fill/enlarge:1/aHR0cHM6Ly9zdGF0aWMucmEuY28vaW1hZ2VzL2NsdWJzL294aV9oYXVwdGxvZ29fc2Nod2FyemludmVydGVkLmpwZz9kYXRlVXBkYXRlZD0xNjM1NDM1MjYwNjU3",
  image_url:
  "https://images.unsplash.com/photo-1568973290903-850cb66e92c9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80"
)

Venue.create!(
  name:
  "Gretchen",
  definition:
  "Gretchen's programming covers electronica, electro, trap, house, bass, dubstep, drum'n'bass, experimental, avantgarde, funk and hip hop - mostly on two floors. The club is located in Berlin-Kreuzberg. The building features a vaulted ceiling on columns. An outdoor courtyard is open during summer.",
  address:
  "Obentrautstr. 19-21 10963 Berlin",
  logo:
  "https://imgproxy.ra.co/_/quality:66/h:180/w:180/extend:1/rt:fill/enlarge:1/aHR0cHM6Ly9zdGF0aWMucmEuY28vaW1hZ2VzL2NsdWJzL2RlLWJlcmxpbmdyZXRjaGVuY2x1Yi5qcGc_ZGF0ZVVwZGF0ZWQ9MTQ0NDkyNDQ5MjA5Mw==",
  image_url:
  "https://imgproxy.ra.co/_/quality:66/w:1500/rt:fill/aHR0cHM6Ly9zdGF0aWMucmEuY28vaW1hZ2VzL2NsdWJzL2xnL2RlLWdyZXRjaGVuLmpwZz9kYXRlVXBkYXRlZD0xNDQ0OTI0NDkyMDkz"
)

Venue.create!(
  name:
  "Cassiopeia",
  definition:
  "Nightclub with a subculture edge & live music program in a former industrial hall with a courtyard.",
  address:
  "Revaler Str 99, 10245 Berlin",
  logo:
  "https://imgproxy.ra.co/_/quality:66/h:180/w:180/extend:1/rt:fill/enlarge:1/aHR0cHM6Ly9zdGF0aWMucmEuY28vaW1hZ2VzL2NsdWJzL2RlLWNhc3NvcGVkaWEuanBnP2RhdGVVcGRhdGVkPTE0NDQ4Mzc1NDIxMTM=",
  image_url:
  "https://images.unsplash.com/photo-1574847052651-02b57f7f5a4e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1674&q=80"
)

Venue.create!(
  name:
  "Watergate",
  definition:
  "Watergate is a split-level, two-room club overlooking the River Spree in Berlin's Kreuzberg neighbourhood. Located on the river's edge with floor-to-ceiling glass windows, it offers a panoramic view of the Spree with curtains that can let the daylight in as the club night winds down. Known for its LED lighting panel that spans the entire length of the top floor of the club, Watergate mostly plays host to house and techno parties. In 2008, it started a record label: Watergate Records.",
  address:
  "Falckensteinstrasse, 49 10997 Berlin",
  logo:
  "https://imgproxy.ra.co/_/quality:66/h:180/w:180/extend:1/rt:fill/enlarge:1/aHR0cHM6Ly9zdGF0aWMucmEuY28vaW1hZ2VzL2NsdWJzL2RlLWJlcmxpbi13YXRlcmdhdGUuanBnP2RhdGVVcGRhdGVkPTE2MTAyMTE4MDM4NjM=",
  image_url:
  "https://images.unsplash.com/photo-1618176581124-72177645bd15?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80"
)

  Venue.create!(
  name:
  "Paloma",
  definition:
  "Dance floors on 2 levels & music by guest DJs, plus cocktails in a cool club with a gritty vibe.",
  address:
  "Skalitzer Str. 135, 10999 Berlin",
  logo:
  "https://imgproxy.ra.co/_/quality:66/h:180/w:180/extend:1/rt:fill/enlarge:1/aHR0cHM6Ly9zdGF0aWMucmEuY28vaW1hZ2VzL2NsdWJzL3BhbG9tYWJhcnJhbG9nby5qcGc_ZGF0ZVVwZGF0ZWQ9MTUzNjI0MDIwOTE5Nw==",
  image_url:
  "https://images.unsplash.com/photo-1519111887837-a48ccf9edc00?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80"
)


puts "done seeding #{Venue.count} venues"

puts "preparing seeding events"

status = %w[Ready Online Offline Hot Approved]
categories = %w[Party Concert Gathering Techno Jazz Pop House Eletronica Alternative]
dresscode = %w[Naked Fetish Street Chic Pole Casual Sport Funky Funny Black White Summer Short Half-Naked Dressed]

event1 = Event.new(
  title: "XFORM x Ilian Tape with Skee Mask",
  description: Faker::Quote.famous_last_words,
  status: status.sample,
  category: "Techno",
  capacity: 80,
  dresscode: dresscode.sample,
  start_date: Time.now + rand(0..1).hours,
  end_date: Time.now + rand(3..8).hours,
  user_id: User.all.sample.id,
  venue_id: Venue.find_by_name("RSO.BERLIN").id
)
file1 = URI.open("https://source.unsplash.com/random?club-party")
event1.photo.attach(io: file1, filename: event1.title, content_type: "image/jpg")
event1.save!

Chatroom.create!(
  name: event1.title,
  event_id: event1.id
)

65.times do
  Rsvp.create!(
    user_id: User.all.sample.id,
    event_id: event1.id,
    current_attending: true
  )
end

event2 = Event.new(

  title: "Tresor meets Giant Swan",
  description: Faker::Quote.famous_last_words,
  status: status.sample,
  category: "Techno",
  capacity: 80,
  dresscode: dresscode.sample,
  start_date: Time.now + rand(0..2).hours,
  end_date: Time.now + rand(3..8).hours,
  user_id: User.all.sample.id,
  venue_id: Venue.find_by_name("Tresor").id
)
file2 = URI.open(
  "https://source.unsplash.com/random?club-party")
event2.photo.attach(io: file2, filename: event2.title, content_type: "image/jpg")
event2.save!

Chatroom.create!(
  name: event2.title,
  event_id: event2.id
)

65.times do
  Rsvp.create!(
    user_id: User.all.sample.id,
    event_id: event2.id,
    current_attending: true
  )
end

event3 = Event.new(

  title: "SESH",
  description: Faker::Quote.famous_last_words,
  status: status.sample,
  category: "Techno",
  capacity: rand(10..30),
  dresscode: dresscode.sample,
  start_date: Time.now + rand(0..2).hours,
  end_date: Time.now + rand(3..8).hours,
  user_id: User.all.sample.id,
  venue_id: Venue.find_by_name("Tresor").id
)
file3 = URI.open(
  "https://source.unsplash.com/random?club-party")
event3.photo.attach(io: file3, filename: event3.title, content_type: "image/jpg")
event3.save!

Chatroom.create!(
  name: event3.title,
  event_id: event3.id
)

event4 = Event.new(

  title: "Fetched party",
  description: Faker::Quote.famous_last_words,
  status: status.sample,
  category: "Techno",
  capacity: rand(10..30),
  dresscode: dresscode.sample,
  start_date: Time.now + rand(0..2).hours,
  end_date: Time.now + rand(3..8).hours,
  user_id: User.all.sample.id,
  venue_id: Venue.find_by_name("Gretchen").id
)
file4 = URI.open(
  "https://source.unsplash.com/random?club-party")
  event4.photo.attach(io: file4, filename: event4.title, content_type: "image/jpg")
event4.save!

Chatroom.create!(
  name: event4.title,
  event_id: event4.id
)

event5 = Event.new(

  title: "Buttons",
  description: Faker::Quote.famous_last_words,
  status: status.sample,
  category: "Alternative",
  capacity: rand(10..30),
  dresscode: dresscode.sample,
  start_date: Time.now + rand(0..2).hours,
  end_date: Time.now + rand(3..8).hours,
  user_id: User.all.sample.id,
  venue_id: Venue.find_by_name("Zenner").id
)
file5 = URI.open(
  "https://source.unsplash.com/random?club-party")
event5.photo.attach(io: file5, filename: event5.title, content_type: "image/jpg")
event5.save!

Chatroom.create!(
  name: event5.title,
  event_id: event5.id
)

event6 = Event.new(

  title: "Nia Archives - UP YA ARCHIVES",
  description: Faker::Quote.famous_last_words,
  status: status.sample,
  category: "Techno",
  capacity: rand(10..30),
  dresscode: dresscode.sample,
  start_date: Time.now + rand(0..2).hours,
  end_date: Time.now + rand(3..8).hours,
  user_id: User.all.sample.id,
  venue_id: Venue.find_by_name("Trauma Bar und Kino").id
)
file6 = URI.open(
  "https://source.unsplash.com/random?club-party")
event6.photo.attach(io: file6, filename: event6.title, content_type: "image/jpg")
event6.save!

Chatroom.create!(
  name: event6.title,
  event_id: event6.id
)

event7 = Event.new(

  title: "Klubnacht",
  description: Faker::Quote.famous_last_words,
  status: status.sample,
  category: "Techno",
  capacity: rand(10..30),
  dresscode: dresscode.sample,
  start_date: Time.now + rand(0..2).hours,
  end_date: Time.now + rand(3..8).hours,
  user_id: User.all.sample.id,
  venue_id: Venue.find_by_name("Berghain").id
)
file7 = URI.open(
  "https://assets.evntsvc.net/images/placeholder/84f826f30ffe77511dae.jpg")
event7.photo.attach(io: file7, filename: event7.title, content_type: "image/jpg")
event7.save!

Chatroom.create!(
  name: event7.title,
  event_id: event7.id
)

event8 = Event.new(

  title: "Fornicate Rave",
  description: Faker::Quote.famous_last_words,
  status: status.sample,
  category: "Techno",
  capacity: rand(10..30),
  dresscode: dresscode.sample,
  start_date: Time.now + rand(0..2).hours,
  end_date: Time.now + rand(3..8).hours,
  user_id: User.all.sample.id,
  venue_id: Venue.find_by_name("Suicide Club").id
)
file8 = URI.open(
"https://cdn.evntsvc.net/r/e/ev_krCT3W3ZtUOkLpr7rH7N8g-243_lm.jpg")
  event8.photo.attach(io: file8, filename: event8.title, content_type: "image/jpg")
event8.save!

Chatroom.create!(
  name: event8.title,
  event_id: event8.id
)

event9 = Event.new(

  title: "Slow Life 10th Anniversary Weekender",
  description: Faker::Quote.famous_last_words,
  status: status.sample,
  category: "Techno",
  capacity: rand(10..30),
  dresscode: dresscode.sample,
  start_date: Time.now + rand(0..2).hours,
  end_date: Time.now + rand(3..8).hours,
  user_id: User.all.sample.id,
  venue_id: Venue.find_by_name("Hoppetosse").id
)
file9 = URI.open(
  "https://source.unsplash.com/random?club-party")
  event9.photo.attach(io: file9, filename: event9.title, content_type: "image/jpg")
event9.save!

Chatroom.create!(
  name: event9.title,
  event_id: event9.id
)

event10 = Event.new(

  title: "Ride - with Bashkka, Cryptofauna, DJ AYA, Mohajer, Monty Luke, Olivia Mendez",
  description: Faker::Quote.famous_last_words,
  status: status.sample,
  category: "Techno",
  capacity: rand(10..30),
  dresscode: dresscode.sample,
  start_date: Time.now + rand(0..2).hours,
  end_date: Time.now + rand(3..8).hours,
  user_id: User.all.sample.id,
  venue_id: Venue.find_by_name("OXI").id
)
file10 = URI.open(
  "https://cdn.evntsvc.net/r/e/ev_4jgRFwny1UKe4Np9xzhC6w-938_lm.jpg")
event10.photo.attach(io: file10, filename: event10.title, content_type: "image/jpg")
event10.save!

Chatroom.create!(
  name: event10.title,
  event_id: event10.id
)

event12 = Event.new(

  title: "Enorm in Form",
  description: Faker::Quote.famous_last_words,
  status: status.sample,
  category: "Techno",
  capacity: rand(10..30),
  dresscode: "Sport",
  start_date: Time.now + rand(0..2).hours,
  end_date: Time.now + rand(3..8).hours,
  user_id: User.all.sample.id,
  venue_id: Venue.find_by_name("Kater Blau").id
)
file12 = URI.open(
  "https://cdn.evntsvc.net/r/e/ev_S3MUAkgehEWQaAu_4g-ntg-949_lm.jpg")
event12.photo.attach(io: file12, filename: event12.title, content_type: "image/jpg")
event12.save!

Chatroom.create!(
  name: event12.title,
  event_id: event12.id
)

event13 = Event.new(

  title: "Happy Days Bambule (House & Techno, Hip Hop, 80s 90s & Pop)",
  description: Faker::Quote.famous_last_words,
  status: status.sample,
  category: "Pop",
  capacity: rand(10..30),
  dresscode: dresscode.sample,
  start_date: Time.now + rand(0..2).hours,
  end_date: Time.now + rand(3..8).hours,
  user_id: User.all.sample.id,
  venue_id: Venue.find_by_name("Cassiopeia").id
)
file13 = URI.open(
  "https://cdn.evntsvc.net/r/e/ev_VTpwZTcADE2Au1MH94UmaQ-936_lm.jpg")
event13.photo.attach(io: file13, filename: event13.title, content_type: "image/jpg")
event13.save!

Chatroom.create!(
  name: event13.title,
  event_id: event13.id
)

event14 = Event.new(

  title: "The Spell: Fejká LIVE, Jos & Eli, Madmotormiquel, Niki Sadeki, Rey&Kjavik, Zaharaa Drekk",
  description: Faker::Quote.famous_last_words,
  status: status.sample,
  category: "Techno",
  capacity: rand(10..30),
  dresscode: dresscode.sample,
  start_date: Time.now + rand(0..2).hours,
  end_date: Time.now + rand(3..8).hours,
  user_id: User.all.sample.id,
  venue_id: Venue.find_by_name("Watergate").id
)
file14 = URI.open(
  "https://cdn.evntsvc.net/r/e/ev_aso0Lt0xqUyrWXYKqUUexg-222_lm.jpg")
event14.photo.attach(io: file14, filename: event14.title, content_type: "image/jpg")
event14.save!

Chatroom.create!(
  name: event14.title,
  event_id: event14.id
)

event15 = Event.new(

  title: "All night long with INVERNO",
  description: Faker::Quote.famous_last_words,
  status: status.sample,
  category: "Techno",
  capacity: rand(10..30),
  dresscode: dresscode.sample,
  start_date: Time.now + rand(0..2).hours,
  end_date: Time.now + rand(3..8).hours,
  user_id: User.all.sample.id,
  venue_id: Venue.find_by_name("Paloma").id
)
file15 = URI.open(
"https://source.unsplash.com/random?club-party")
event15.photo.attach(io: file15, filename: event15.title, content_type: "image/jpg")
event15.save!

Chatroom.create!(
  name: event15.title,
  event_id: event15.id
)


100.times do
  start = Time.now
  event = Event.new(

    title: Faker::Music::RockBand.song,
    description: Faker::Quote.famous_last_words,
    status: status.sample,
    category: categories.sample,
    capacity: rand(10..100),
    dresscode: dresscode.sample,
    start_date: start + rand(1..10).days,
    end_date: start + rand(10..12).days,
    user_id: User.all.sample.id,
    venue_id: Venue.all.sample.id
  )
  file = URI.open("https://source.unsplash.com/random?party")
  event.photo.attach(io: file, filename: event.title, content_type: "image/jpg")
  event.save!

  Chatroom.create!(
    name: event.title,
    event_id: event.id
  )
end



puts "created #{Event.count} events"


20.times do
  Artist.create!(
    name: Faker::Music.band,
    about: Faker::Quote.famous_last_words,
    genre: Faker::Music.genre,
    link: "https://soundcloud.com/woym",
    image_url: "https://cdn.prod.www.spiegel.de/images/a71d32b1-de0a-495d-b615-8872ed34faf0_w948_r1.778_fpx50_fpy48.webp"
  )
end

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
artist8 = Artist.create!(
  name: "Metodi Hristov",
  about: "With his truly unique style, ranging from the darker side of tech house to the raw house beats, Bulgarian-based Metodi Hristov was able to win the fans of electronic music for a short period of time.",
  genre: "Tech House",
  link: "https://soundcloud.com/metodihristov",
  image_url: "https://scontent-fra3-1.xx.fbcdn.net/v/t39.30808-6/283669849_576527857168658_8623932100992968467_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=0FK9TQTiGQcAX9gQ1aZ&_nc_ht=scontent-fra3-1.xx&oh=00_AfBR02Ne3PLhGKy-v4f4LfG8ChbGjYWaEvLCr0jqOcm6PQ&oe=640F20C3"
)

puts "created #{Artist.count} artists"

500.times do
  Lineup.create!(
    artist_id: Artist.all.sample.id,
    event_id: Event.all.sample.id
  )
end



1200.times do
  Rsvp.create!(
    user_id: User.all.sample.id,
    event_id: Event.all.sample.id,
    current_attending: true
  )
end

puts "created #{Rsvp.count} rsvps"


puts "created #{Chatroom.count} chatrooms"


puts "DATABASE SUCCESSFULL SEEDED"
puts "Since now Jose is also Happy!!!"
