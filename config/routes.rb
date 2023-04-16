Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "home#index";
  #get "about", to: "about#index";
  get "about-us", to: "about#index", as: :about;
  
  get "signup", to: "registrations#new";
  post "signup", to: "registrations#create";
  
  get "signin", to: "sessions#new";
  post "signin", to: "sessions#create";

  delete "signout", to: "sessions#destroy";

  get "password", to:"passwords#edit";
  patch "password", to: "passwords#update";

  get "password_reset", to: "password_resets#new"
  post "password_reset", to: "password_resets#create"

  get "password_reset/edit", to: "password_resets#edit"
  patch "password_reset/edit", to: "password_resets#update"
  
  # Defines the root path route ("/")
  # root "articles#index"

end
