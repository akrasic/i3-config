#!/usr/bin/env ruby
# Fetch weather for your city from OpenWeatherMap
# You need an API key to fetch data, and store the API key inside ENV
# export I3_OWM_APIKEY=""
# Depends on Weather Icons: https://erikflowers.github.io/weather-icons/

require 'open-uri'
require 'json'
# Get info from open weather map
class Weather
  API = 'http://api.openweathermap.org/data/2.5/weather?id=CITY&units=metric&APPID=APIKEY'
  API_KEY = '66f1ea14c4ea26d4be77231b4563dfdb'

  attr_accessor :api_url, :weather

  def initialize(city)
    @api_url = API.gsub('CITY', city).gsub('APIKEY', API_KEY)
    @weather = contact_openweathermap
  end

  # Public - Return formated response - temperature / weather
  #
  # Returns String
  def show
    info = @weather['weather'][0]['main']
    temp = @weather['main']['temp']
    " #{temp}   #{icon(info)} #{info}"
  end

  private

  # Private - Use FontAwesome icons to show the weather conditions
  #
  # Returns Unicode char
  def icon(weather)
    case weather
    when 'Fog' then ''
    when /Clear/ then ' '
    when /Rain/ then ''
    when /Cloud/ then ''
    when /Snow/ then ''
    else
      ''
    end
  end

  # Private - Fetch information from OpenWeatherMap
  #
  # Returns Hash
  def contact_openweathermap
    JSON.parse(open(@api_url).read)
  end
end

# city = 'Zagreb'
city_id = '6618983'
out = Weather.new(city_id).show

puts "#{out}"
