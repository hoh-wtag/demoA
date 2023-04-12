Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: "home#index";
  #get "about", to: "about#index";
  get "about-us", to: "about#index", as: :about;
  get "signup", to: "registrations#new";
  post "signup", to: "registrations#create";

  # Defines the root path route ("/")
  # root "articles#index"

end
