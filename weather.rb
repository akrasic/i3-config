#!/usr/bin/env ruby
# Fetch wearher information for your city
require 'open-uri'
require 'json'

city="Zagreb"

class Weather
  API='http://api.openweathermap.org/data/2.5/weather?q=CITY&units=metric'

  attr_accessor :city

  def initialize(city)
    @city = city
  end

  # Public - Return formated response - temperature / weather
  #
  # Returns String
  def show
    weather = contact_openweathermap
    info = weather['weather'][0]['main']
    temp = weather['main']['temp']
    "#{info} #{temp} °C"
  end

  # Private - Fetch information from OpenWeatherMap
  #
  # Returns Hash
  def contact_openweathermap
    url = API.gsub('CITY', @city)
    JSON.parse(open(url).read)
  end
end

puts Weather.new(city).show
