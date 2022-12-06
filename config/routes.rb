Rails.application.routes.draw do
  namespace :api do 
    namespace :v1 do 
     resources :merchants, only: [:index, :show]
      #get "/api/v1/merchants", to: "merchants#show"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
