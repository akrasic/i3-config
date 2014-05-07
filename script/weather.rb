#!/usr/bin/env ruby
# Fetch wearher information for your city
require 'open-uri'
require 'json'

city="Zagreb"

class Weather
  API='http://api.openweathermap.org/data/2.5/weather?q=CITY&units=metric'

  attr_accessor :api_url, :weather

  def initialize(city)
    @api_url = API.gsub('CITY', city)
    @weather = contact_openweathermap
  end

  # Public - Return formated response - temperature / weather
  #
  # Returns String
  def show
    info = @weather['weather'][0]['main']
    temp = @weather['main']['temp']
    "#{info} #{temp} °C"
  end

  # Private - Fetch information from OpenWeatherMap
  #
  # Returns Hash
  def contact_openweathermap
    JSON.parse(open(@api_url).read)
  end
end

puts Weather.new(city).show
