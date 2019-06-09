puts "Clean database..."

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

# locations
puts "Creating locations"
location_list = [
{
  city: "Melbourne",
  country: "Australia",
  state: "Victoria",
  latitude: -37.8136,
  longitude: 144.96332
},
{
  city: "Sydney",
  country: "Australia",
  state: "NSW",
  latitude: -33.865143,
  longitude: 151.209900
},
{
  city: "Singapore",
  country: "Singapore",
  state: "Singapore",
  latitude: 1.286025,
  longitude: 103.860812
},
{
  city: "London",
  country: "England",
  state: "England",
  latitude: 51.500923,
  longitude: 0.124604
},
{
  city: "New York",
  country: "USA",
  state: "NY",
  latitude: 40.783076,
  longitude: -73.965334
},
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
  photo: "https://www.dive.is/thumbs/diving-snorkeling-tours/diving-day-tours/silfra-diving-day-tour/colorful-clear-water-silfra-1800x1199.jpg"
},
{
  title: "Scuba Diving",
  photo: "https://images.unsplash.com/photo-1559600837-d0ced1da77d1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1250&q=80"
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
  photo: "https://images.unsplash.com/photo-1489993360877-883980cc7333?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"
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
}]

Activity.create!(activity_list)
puts "Created #{Activity.count} activit(y/ies)"

# itineraries
puts "Creating itineraries"
itinerary_list = [
{
  user_id: User.first.id,
  title: "Australia Trip",
  start_date: "2019-10-15",
  end_date: "2019-10-21",
  description: "An ozzie adventure",
  status: 0
}]
Itinerary.create!(itinerary_list)
puts "Created #{Itinerary.count} itinerar(y/ies)"

# events
puts "Creating events"
event_list = [
{
  location_id: Location.pluck(:id).sample,
  itinerary_id: Itinerary.pluck(:id).sample,
  activity_id: Activity.pluck(:id).sample,
  title: "Melbourne Night Market",
  start_date: "2019-10-15",
  end_date: "2019-10-17",
  description: "A foodie feast",
  max_spots: 3
},
{
  location_id: Location.pluck(:id).sample,
  itinerary_id: Itinerary.pluck(:id).sample,
  activity_id: Activity.pluck(:id).sample,
  title: "Gin Tasting",
  start_date: "2019-10-17",
  end_date: "2019-10-18",
  description: "A fun filled event of bespoke G&Ts, DIY cocktails, and gin-themed park parties.",
  max_spots: 2
},
{
  location_id: Location.pluck(:id).sample,
  itinerary_id: Itinerary.pluck(:id).sample,
  activity_id: Activity.pluck(:id).sample,
  title: "Melbourne Truffle Festival",
  start_date: "2019-10-17",
  end_date: "2019-10-21",
  description: "Highlights include truffle cooking demos by top chefs, and a mock hunt by truffle dogs Arrow and Spice. Bring some loot, because you’ll definitely want to taste this festival. There are irresistible bites like Black Angus truffle burgers from the new Truffle Truck, truffle cocktails, cider and ale. Products to take home include truffle honey and actual fresh truffles.",
  max_spots: 4
}]
Event.create!(event_list)
puts "Created #{Event.count} event(s)"








