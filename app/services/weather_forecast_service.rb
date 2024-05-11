require 'net/http'

class WeatherForecastService
	class << self
		def fetch_by_location location
			coordinates = geocode_location(location)
			return nil unless coordinates

			fetch_data(coordinates['latitude'], coordinates['longitude'])
		end

		private

		def fetch_data latitude, longitude, temperature = "temperature_2m"
			url = generate_url("https://api.open-meteo.com/v1/forecast", {
				latitude: latitude, longitude: longitude, hourly: temperature
			})
			response = Net::HTTP.get_response(url)

			JSON.parse(response.body) if response.is_a?(Net::HTTPSuccess)
		end

		def geocode_location location
			url = generate_url("https://geocoding-api.open-meteo.com/v1/search", {
				name: location, count: 1
			})
			response = Net::HTTP.get_response(url)
			JSON.parse(response.body)["results"][0] if response.is_a?(Net::HTTPSuccess) && JSON.parse(response.body)["results"].present?
		end

		def generate_url url, params = {}
			uri = URI.parse(url)
			uri.query = URI.encode_www_form(params)
			uri
		end
	end
end
