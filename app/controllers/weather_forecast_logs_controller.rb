class WeatherForecastLogsController < ApplicationController
	before_action :set_weather_forecast_chart_data

	def index
		@weather_forecast_logs = WeatherForecastLog.all
	end

	def search_by_location
			weather_forecast_log = WeatherForecastLog.insert params.dig(:country) if params.dig(:country).present?

			redirect_to weather_forecast_logs_path(location_id: weather_forecast_log.id)
	end

	protected
	def set_weather_forecast_chart_data
		@location_id = params.dig(:location_id)
		@weather_forecast_log = nil
		@weather_forecast_chart_data = []
		return unless @location_id.present?

		@weather_forecast_log = WeatherForecastLog.find @location_id
		return unless @weather_forecast_log.present?

		@weather_forecast_chart_data = @weather_forecast_log.generate_chart_data
	end
end
