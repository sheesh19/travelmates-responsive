puts "Clean database..."

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
  latitude: -37.814,
  longitude: 144.96332
}]
Location.create!(location_list)
puts "Created #{Location.count} location(s)"

# activities
puts "Creating activities"
activity_list = [
{
  title: "Food Markets"
},
{
  title: "Snorkeling"
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








