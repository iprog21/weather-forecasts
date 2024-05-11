Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
		resources :weather_forecast_logs, path: 'weather-forecast' do
			collection do
				 post :search_by_location
			end
		end
end
