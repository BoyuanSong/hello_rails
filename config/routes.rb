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

  resources :products

  resource :cart, only:[:show, :destroy] do
    collection do
      post :add, path:'add/:id'
    end
  end
end
