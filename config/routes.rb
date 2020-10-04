Rails.application.routes.draw do
  get 'messases/index'
  root to: "home#index"
end
