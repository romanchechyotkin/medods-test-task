Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :patients do end
      resources :consultation_requests do 
        # recommendations
      end
    end
  end
end
