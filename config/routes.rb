Rails.application.routes.draw do
  devise_for :users
  root "feed#index"

  get "settings", to: "profile#edit"
  patch "settings", to: "profile#update"

  resources :blabs, only: %i[new create]

  scope '/u/:handle', as: "user" do
    resources :blabs, only: %i[index show]
  end
end
