

## **Weather Forecast Logs**


    Technical Specs:
    1. ruby (ruby 3.1.0p0)
    2. rails (Rails 7.0.8.1)

    Installation:
    3. download and extract the source code
    4. navigate the folder via terminal
    6. rails db:migrate
    7. rails s
    8. visit http://localhost:3000/weather-forecast

	For Running Tests:
	1. Search Weather Forecast by Location Name & Log Weather Forecast Data:
	> rails test test/services/weather_forecast_service_test.rb
	2. Visiting Weather Forecast Logs Page:
	> rails test test/controllers/weather_forecasts_controller_test.rb

	Added Gems:
	gem "bootstrap"
	gem "sassc-rails"
	gem "city-state"
	gem "chartkick"

	API: # Weather Forecast API
	1. For Searching Weather Forecast Data - https://api.open-meteo.com/v1/forecast
	2. For Searching Location Coordinates - https://geocoding-api.open-meteo.com/v1/search

	DEMO: https://www.loom.com/share/56436c990e1c448d9cb5f1731f913705?sid=6e9fb2be-8c33-42d3-a439-a941a05c8c4b
