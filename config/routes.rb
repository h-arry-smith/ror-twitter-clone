Rails.application.routes.draw do
  devise_for :users
  root "feed#index"

  get "settings", to: "profile#edit"
  patch "settings", to: "profile#update"

  resources :blabs, only: %i[new create]

  get 'u/:handle', as: "profile", to: "profile#index"
  scope '/u/:handle', as: "user" do
    resources :blabs, only: %i[index show]
    get '/blabs/:id/reply', to: "blabs#reply", as: "reply"

    get "followers", to: "profile#followers"
    get "following", to: "profile#following"

    post "follow", to: "profile#follow"
    delete "follow", to: "profile#unfollow"
  end
end
