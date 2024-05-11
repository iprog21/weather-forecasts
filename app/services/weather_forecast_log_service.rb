class WeatherForecastLogService
	class << self
		def call(weather_forecast_data, location_name)
			weather_forecast_log = WeatherForecastLog.create(
				location_name: location_name,
				latitude: weather_forecast_data['latitude'],
				longitude: weather_forecast_data['longitude'],
				generationtime_ms: weather_forecast_data['generationtime_ms'],
				utc_offset_seconds: weather_forecast_data['utc_offset_seconds'],
				timezone: weather_forecast_data['timezone'],
				timezone_abbreviation: weather_forecast_data['timezone_abbreviation'],
				elevation: weather_forecast_data['elevation'],
				hourly_units: weather_forecast_data['hourly_units'],
				hourly: weather_forecast_data['hourly']
			)
		end
	end
end
