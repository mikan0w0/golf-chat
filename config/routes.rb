Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  devise_for :users
  root to: "home#index"
  resources :home
  resources :categories, only: [:index, :new, :create] do
    resources :contents do
      resources :comments
    end
  end

end

