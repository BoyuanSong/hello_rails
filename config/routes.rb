Rails.application.routes.draw do
  resources :visitors, only:[:index,:new, :create, :destroy] do
      get :log, on: :collection
      post :log_in, on: :collection
      get :log_out, on: :collection
    end
  resources :comments




  get "bmi", to: "bmi#index"
  post "bmi/result", to: "bmi#result"

  root "welcome#index"
  get "intro", to: "welcome#intro"

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
