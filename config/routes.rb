Rails.application.routes.draw do
  get "bmi", to: "bmi#index"
  post "bmi/result", to: "bmi#result"

  root "welcome#index"

  resources :candidates do
    member do
      post :vote
    end
  end

  resources :posts
  resources :users

end
