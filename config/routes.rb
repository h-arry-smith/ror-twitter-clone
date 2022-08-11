Rails.application.routes.draw do
  devise_for :users
  root "feed#index"

  get "settings", to: "profile#edit"
  patch "settings", to: "profile#update"
end
