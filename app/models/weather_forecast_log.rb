class WeatherForecastLog < ApplicationRecord
	class << self
		def insert location_name
			# fetch data by location name
			weather_forecast_data = WeatherForecastService.fetch_by_location location_name

			# save data to database
			WeatherForecastLogService.call(weather_forecast_data, location_name) if weather_forecast_data.present?
		end
	end

	def display_title = "#{location_name} (#{latitude},#{longitude}) at #{created_at.strftime('%B %d, %Y at %I:%M %p')}"

	def generate_chart_data
		time = hourly['time']
		temperature_2m = hourly['temperature_2m']

		chart_data = {}
		time.each_with_index do |t, index|
			chart_data[t] = temperature_2m[index]
		end

		chart_data
	end
end
