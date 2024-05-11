# test/services/weather_forecast_service_test.rb
require 'test_helper'

class WeatherForecastServiceTest < ActiveSupport::TestCase
		def setup
			@locations = ["Philippines", "New York", "Paris", "London"]
			@location_name = @locations.sample
			@weather_forecast_data = WeatherForecastService.fetch_by_location(@location_name)
		end

		test "should fetch weather forecast data by location from Open-Meteo API" do
			assert_not_nil @weather_forecast_data
			assert_not_nil @weather_forecast_data["latitude"]
			assert_not_nil @weather_forecast_data["longitude"]
			assert_not_nil @weather_forecast_data["elevation"]
		end

		test "should log weather forecast data for every request" do
			weather_forecast_log = WeatherForecastLogService.call(@weather_forecast_data, @location_name)

			assert_not_nil weather_forecast_log
			assert_not_nil weather_forecast_log.location_name
			assert_not_nil weather_forecast_log.latitude
			assert_not_nil weather_forecast_log.longitude
			assert_not_nil weather_forecast_log.elevation
		end
end
