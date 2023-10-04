Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :patients do 
        get "recommendations", on: :member
      end
      resources :consultation_requests do 
        post "recommendations", on: :member
      end
    end
  end
end
