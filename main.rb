require "rubygems"
require "httparty"

class Random
  include HTTParty
  base_uri "https://randomuser.me/"

  def api
    self.class.get('/api/')
  end
end

rand = Random.new
name = rand.api['results'][0]['name']['title']+" "+rand.api['results'][0]['name']['first']+" "+rand.api['results'][0]['name']['last']
gender = rand.api['results'][0]['gender']
street = rand.api['results'][0]['location']['street']['number']
add = rand.api['results'][0]['location']['street']['name']
city = rand.api['results'][0]['location']['city']
state = rand.api['results'][0]['location']['state']
country = rand.api['results'][0]['location']['country']
zip = rand.api['results'][0]['location']['postcode']
timezone = rand.api['results'][0]['location']['timezone']['offset']+" "+rand.api['results'][0]['location']['timezone']['description']
email = rand.api['results'][0]['email']

puts "Name: #{name}
Gender: #{gender}
Email: #{email}
Address: #{street} #{add}
City: #{city}
State: #{state}
Country: #{country}
Postal Code: #{zip}
Timezone: #{timezone}"
