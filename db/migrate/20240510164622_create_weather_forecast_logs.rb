class CreateWeatherForecastLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :weather_forecast_logs do |t|
						t.string :location_name
						t.decimal :latitude, precision: 10, scale: 2
						t.decimal :longitude, precision: 10, scale: 2
						t.decimal :generationtime_ms, precision: 10, scale: 2
						t.integer :utc_offset_seconds
						t.string :timezone
						t.string :timezone_abbreviation
						t.integer :elevation
						t.json :hourly_units
						t.json :hourly
      t.timestamps
    end
  end
end
