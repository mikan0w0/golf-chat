Rails.application.routes.draw do
<<<<<<< Updated upstream
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
=======
  devise_for :users
  root to: "home#index"
  resources :home
  resources :categories, only: [:index, :new, :create] do
    resources :contents do
      resources :comments
    end
  end

end
>>>>>>> Stashed changes
