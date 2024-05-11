require 'test_helper'

class WeatherForecastsControllerTest < ActionDispatch::IntegrationTest
	setup do
		@forecast_one = weather_forecast_logs(:weather_forecast_one)
		@forecast_two = weather_forecast_logs(:weather_forecast_two)
	end

	test "visit index page" do
		get weather_forecast_logs_path

		assert_response :success
		assert_select "h1", "Weather Forecast Logs"

		assert_select "form[action=?][method=?]", search_by_location_weather_forecast_logs_path, "post" do
				assert_select "select[name=?]", "country"
				assert_select "input[type=?][value=?]", "submit", "Search"
		end

		assert_select "select[name=?]", "country" do
				assert_select "option", "Select a country"
		end

		assert_select "table" do
			assert_select "thead" do
				assert_select "tr" do
					assert_select "th", "Location Name"
					assert_select "th", "Latitude"
					assert_select "th", "Longitude"
					assert_select "th", "Elevation"
					assert_select "th", "Created At"
				end
			end
		end
	end
end
