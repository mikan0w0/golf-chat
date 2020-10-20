Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"
  resources :home
  resources :categories, only: [:index, :new, :create] do
    resources :contents do
      resources :comments
    end
  end

end

