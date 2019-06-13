puts "Clean database..."

Tag.destroy_all
EventRegistration.destroy_all
EventFavorite.destroy_all
Event.destroy_all
Location.destroy_all
Activity.destroy_all

FavoriteItinerary.destroy_all
Itinerary.destroy_all #child of user, user model updated to destroy dependent when user is destroyed.
User.destroy_all #parent (normally child should be destroyed before parent unless specified in model)

# users
puts "Creating users"
user_list = [
{
  email: "capt.cat@gmail.com",
  password: "password",
  first_name: "Capt.",
  last_name: "Cat",
  username: "Captain_Cat",
  description: "An adventurous kitty who is at home at sea.",
  gender: "Male",
  date_of_birth: "2010-05-15",
  avatar: "captain_cat.jpg"
},
{
  email: "sheila.crikey@gmail.com",
  password: "password",
  first_name: "Sheila",
  last_name: "Leveille",
  username: "sheilz",
  description: "Solo traveller starting an unexpected journey. Sam Gamgee is the character I identify with most. I trend towards adventure travel and love the outdoors.",
  gender: "Female",
  date_of_birth: "1994-04-09",
  avatar: "sheila-avatar.jpg"
}]
User.create!(user_list)
puts "Created #{User.count} user(s)"

# activities
puts "Creating tags"
tag_list = [
{
  tag_name: "I'm on a Boat"
},
{
  tag_name: "History"
},
{
  tag_name: "Night Life"
},
{
  tag_name: "Swimming"
},
{
  tag_name: "Mountains"
},
{
  tag_name: "Hiking"
},
{
  tag_name: "Markets"
},
{
  tag_name: "Fashion"
},
{
  tag_name: "Style"
},
{
  tag_name: "Education"
},
{
  tag_name: "Great Outdoors"
},
{
  tag_name: "Adventure"
},
{
  tag_name: "Foodie"
},
{
  tag_name: "Nature"
},
{
  tag_name: "Long Walks"
},
{
  tag_name: "Water Activities"
},
{
  tag_name: "Exploration"
},
{
  tag_name: "Indoors"
},
{
  tag_name: "Photography"
},
{
  tag_name: "Off the Beaten Track"
},
{
  tag_name: "South America"
},
{
  tag_name: "North America"
},
{
  tag_name: "Asia"
},
{
  tag_name: "Africa"
},
{
  tag_name: "Europe"
},
{
  tag_name: "Pacific"
},
{
  tag_name: "Middle East"
},
{
  tag_name: "Latin America"
},
{
  tag_name: "Animal Sightings"
},
{
  tag_name: "Artsy"
},
{
  tag_name: "Fancy"
},
{
  tag_name: "Budget Friendly"
},
{
  tag_name: "Drinks"
},
{
  tag_name: "Techy"
},
{
  tag_name: "Music"
},
{
  tag_name: "Kid Friendly"
},
{
  tag_name: "Trendy AF"
},
{
  tag_name: "Sports"
},
{
  tag_name: "Do Good"
},
{
  tag_name: "Environmentally Friendly"
},
{
  tag_name: "Adrenaline Rush"
},
{
  tag_name: "Cultural Immersion"
},
{
  tag_name: "Religious"
},
{
  tag_name: "Relaxing"
},
{
  tag_name: "Scuba Diving"
},
{
  tag_name: "Snorkeling"
},
{
  tag_name: "Kayaking"
},
{
  tag_name: "Paddle Boarding"
},
{
  tag_name: "Flying"
},
{
  tag_name: "Cooking"
},
]
Tag.create!(tag_list)
puts "Created #{Tag.count} tag/s"

# locations
puts "Creating locations"
location_list = [
{
  city: "Melbourne",
  country: "Australia",
  state: "Victoria",
  latitude: -37.8238,
  longitude: 144.9913,
  photo: "https://images.unsplash.com/photo-1514395462725-fb4566210144?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2851&q=80"
},
{
  city: "Sydney",
  country: "Australia",
  state: "NSW",
  latitude: -33.865143,
  longitude: 151.209900,
  photo: "https://images.unsplash.com/photo-1524293581917-878a6d017c71?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80"
},
{
  city: "Singapore",
  country: "Singapore",
  state: "Singapore",
  latitude: 1.286025,
  longitude: 103.860812,
  photo: "https://images.unsplash.com/photo-1525625293386-3f8f99389edd?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1549&q=80"
},
{
  city: "London",
  country: "England",
  state: "England",
  latitude: 51.500923,
  longitude: 0.124604,
  photo: "https://images.unsplash.com/photo-1508711046474-2f4c2d3d30ca?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80"
},
{
  city: "New York",
  country: "USA",
  state: "NY",
  latitude: 40.783076,
  longitude: -73.965334,
  photo: "https://images.unsplash.com/photo-1477882244523-716124bf91a1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2849&q=80"
},
{
  city: "Koh Tao",
  country: "Thailand",
  state: "Thailand",
  latitude: 10.101695,
  longitude: 99.827190,
  photo: "https://images.unsplash.com/photo-1537956965359-7573183d1f57?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1568&q=80"
},
{
  city: "Hong Kong",
  country: "China",
  state: "Hong Kong",
  latitude: 22.342605,
  longitude: 114.193774,
  photo: "https://images.unsplash.com/photo-1517144447511-aebb25bbc5fa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80"
},
{
  city: "Matsuno",
  country: "Japan",
  state: "Shikoku",
  latitude: 33.205563,
  longitude: 132.711406,
  photo: "https://images.unsplash.com/photo-1524413840807-0c3cb6fa808d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80"
},
{
  city: "San Francisco",
  country: "USA",
  state: "California",
  latitude: 37.820192,
  longitude: -122.478213,
  photo: "https://images.unsplash.com/photo-1449034446853-66c86144b0ad?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80"
},
{
  city: "Florence",
  country: "Italy",
  state: "Italy",
  latitude: 43.776935,
  longitude: 11.258739,
  photo: "https://images.unsplash.com/photo-1476362174823-3a23f4aa6d76?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80"
}
]
Location.create!(location_list)
puts "Created #{Location.count} location(s)"

# activities
puts "Creating activities"

activity_list = [
{
  title: "Food Markets",
  photo: "https://images.unsplash.com/photo-1531638280689-3b3cd8ac2833?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1498&q=80"
},
{
  title: "Festival",
  photo: "https://images.unsplash.com/photo-1533174072545-7a4b6ad7a6c3?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80"
},
{
  title: "Snorkeling",
  photo: "https://images.unsplash.com/photo-1499242611767-cf8b9be02854?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1480&q=80"
},
{
  title: "Scuba Diving",
  photo: "https://www.dive.is/thumbs/diving-snorkeling-tours/diving-day-tours/silfra-diving-day-tour/colorful-clear-water-silfra-1800x1199.jpg"
},
{
  title: "Night Life",
  photo: "https://images.unsplash.com/photo-1471967183320-ee018f6e114a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2102&q=80"
},
{
  title: "Hiking",
  photo: "https://images.unsplash.com/photo-1519904981063-b0cf448d479e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
},
{
  title: "Sightseeing",
  photo: "https://images.unsplash.com/photo-1486591913781-4bee9ed65bfe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
},
{
  title: "Walking Tours",
  photo: "https://images.unsplash.com/photo-1501621965065-c6e1cf6b53e2?ixlib=rb-1.2.1&auto=format&fit=crop&w=1504&q=80"
},
{
  title: "Cultural Events",
  photo: "https://images.unsplash.com/photo-1547366868-f5d6fab0440f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80"
},
{
  title: "Street Food",
  photo: "https://images.unsplash.com/photo-1493843007199-f4397137f7d9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
},
{
  title: "Night Markets",
  photo: "https://images.unsplash.com/photo-1526139334526-f591a54b477c?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80"
},
{
  title: "Music Events",
  photo: "https://images.unsplash.com/photo-1524187208855-b6c2f1e78bce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
},
{
  title: "Cycling",
  photo: "https://images.unsplash.com/photo-1541625602330-2277a4c46182?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
},
{
  title: "Massage & Spas",
  photo: "https://images.unsplash.com/photo-1544161515-4ab6ce6db874?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
},
{
  title: "Art Events",
  photo: "https://images.unsplash.com/photo-1485518994577-6cd6324ade8f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1288&q=80"
},
{
  title: "Surfing",
  photo: "https://images.unsplash.com/photo-1530870110042-98b2cb110834?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
},
{
  title: "Paddle Boarding",
  photo: "https://images.unsplash.com/photo-1526188717906-ab4a2f949f26?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
},
{
  title: "Vista Points",
  photo: "https://images.unsplash.com/photo-1483860714521-89abcb02604b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
},
{
  title: "Clubbing",
  photo: "https://images.unsplash.com/photo-1506485854521-3e13d857db0b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2089&q=80"
},
{
  title: "Skate Boarding",
  photo: "https://images.unsplash.com/photo-1445251836269-d158eaa028a6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80"
},
{
  title: "Shopping",
  photo: "https://images.unsplash.com/photo-1482304651556-cb27a6fb596a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1406&q=80"
},
{
  title: "Fishing",
  photo: "https://images.unsplash.com/photo-1502045431165-29b5e9f5befc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
},
{
  title: "Road Trip",
  photo: "https://images.unsplash.com/photo-1468818438311-4bab781ab9b8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80"
},
{
  title: "Volunteering",
  photo: "https://images.unsplash.com/photo-1526976668912-1a811878dd37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
},
{
  title: "Camping",
  photo: "https://images.unsplash.com/photo-1414016642750-7fdd78dc33d9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1498&q=80"
},
{
  title: "Skiing",
  photo: "https://images.unsplash.com/photo-1548825519-a10e24471ff8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2200&q=80"
},
{
  title: "Snowboarding",
  photo: "https://images.unsplash.com/photo-1523246181290-a16e4b9a00b5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1334&q=80"
},
{
  title: "Kayaking",
  photo: "https://images.unsplash.com/photo-1463694372132-6c267f6ba561?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80"
},
{
  title: "Adrenaline Rush",
  photo: "https://images.unsplash.com/photo-1526385604508-05e4e7f0bc61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1789&q=80"
},
{
  title: "Nature Tours",
  photo: "https://images.unsplash.com/photo-1548429930-163885742a36?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
},
{
  title: "Dancing",
  photo: "https://images.unsplash.com/photo-1463592177119-bab2a00f3ccb?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80"
},
{
  title: "Cultural Festival",
  photo: "https://images.unsplash.com/photo-1559760434-0981df057e83?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
}
]

Activity.create!(activity_list)
puts "Created #{Activity.count} activit(y/ies)"

# itineraries
puts "Creating itineraries"
itinerary_list = [
{
  user_id: User.find_by(username: "Captain_Cat").id,
  title: "Le Wagon Full Stack Bootcamp",
  start_date: "2019-04-15",
  end_date: "2019-06-14",
  description: "A Melbourne coding adventure",
  status: 1,
  visibility: 1,
  trip_type: 1
},
{
  user_id: User.find_by(username: "Captain_Cat").id,
  title: "Singapore Foodie Feast",
  start_date: "2019-06-17",
  end_date: "2019-06-21",
  description: "A culinary tour of Singapore's finest hawker markets",
  status: 0,
  visibility: 1,
  trip_type: 1
},
{
  user_id: User.find_by(username: "Captain_Cat").id,
  title: "Thai Scuba Adventure",
  start_date: "2019-06-24",
  end_date: "2019-06-28",
  description: "Best scuba diving spots in Thailand",
  status: 1,
  visibility: 0,
  trip_type: 0
},
{
  user_id: User.find_by(username: "Captain_Cat").id,
  title: "Hong Kong Shopping",
  start_date: "2019-07-01",
  end_date: "2019-07-05",
  description: "Tasty Dim Sum and shopping fun!",
  status: 1,
  visibility: 1,
  trip_type: 0
},
{
  user_id: User.find_by(username: "Captain_Cat").id,
  title: "Cherry Blossoms",
  start_date: "2019-07-08",
  end_date: "2019-07-12",
  description: "Beautiful view of many cherry blossoms and interesting historical shrines and temples.",
  status: 1,
  visibility: 0,
  trip_type: 1
},
{
  user_id: User.find_by(username: "Captain_Cat").id,
  title: "Sightseeing in San Francisco",
  start_date: "2019-07-15",
  end_date: "2019-07-19",
  description: "Golden Gate Bridge and networking in Silicon Valley",
  status: 0,
  visibility: 0,
  trip_type: 1
},
{
  user_id: User.find_by(username: "Captain_Cat").id,
  title: "New York New York",
  start_date: "2019-07-22",
  end_date: "2019-07-26",
  description: "Relaxing in the sun in Central Park",
  status: 1,
  visibility: 1,
  trip_type: 0
},
{
  user_id: User.find_by(username: "Captain_Cat").id,
  title: "My Fair London",
  start_date: "2019-07-29",
  end_date: "2019-08-02",
  description: "Afternoon tea in Mayfair",
  status: 0,
  visibility: 1,
  trip_type: 0
},
{
  user_id: User.find_by(username: "Captain_Cat").id,
  title: "Italian Cultural Tour",
  start_date: "2019-08-05",
  end_date: "2019-08-09",
  description: "Food, Museums and Shopping",
  status: 0,
  visibility: 0,
  trip_type: 0
}
]
Itinerary.create!(itinerary_list)
puts "Created #{Itinerary.count} itinerar(y/ies)"

# events
puts "Creating events"
event_list = [
{
  location_id: Location.find_by(city: "Melbourne").id,
  itinerary_id: Itinerary.find_by(title: "Le Wagon Full Stack Bootcamp").id,
  activity_id: Activity.find_by(title: "Food Markets").id,
  title: "QVM Winter Night Market",
  start_date: "2019-06-19 17:00:00",
  end_date: "2019-06-19 22:00:00",
  description: "A foodie feast",
  max_spots: 3
},
{
  location_id: Location.find_by(city: "Melbourne").id,
  itinerary_id: Itinerary.find_by(title: "Le Wagon Full Stack Bootcamp").id,
  activity_id: Activity.find_by(title: "Festival").id,
  title: "Gin Tasting",
  start_date: "2019-06-17 19:00:00",
  end_date: "2019-06-17 23:00:00",
  description: "A fun filled event of bespoke G&Ts, DIY cocktails, and gin-themed park parties.",
  max_spots: 2
},
{
  location_id: Location.find_by(city: "Melbourne").id,
  itinerary_id: Itinerary.find_by(title: "Le Wagon Full Stack Bootcamp").id,
  activity_id: Activity.find_by(title: "Festival").id,
  title: "Bottomless G&Tea Party",
  start_date: "2019-06-18 14:00:00",
  end_date: "2019-06-18 17:00:00",
  description: "Enjoy two hours of bottomless gin and tonics, matched with delicious sweet and savoury treats. Choose from house-infused gins served in quaint tea cups - find your favourite flavour!",
  max_spots: 4
}]
Event.create!(event_list)
puts "Created #{Event.count} event(s)"








