Lewagon::Application.routes.draw do

  match 'blog' => 'blog#index'
  match 'blog/:title' => 'blog#post'

  resources :courses, :path => "learn"
  resources :suggestions

  match 'learn/:id/subscribe' , :controller => 'courses', :action => 'subscribe', :as => 'course_subscribe', :via => 'post'

  devise_for :admin_users, ActiveAdmin::Devise.config

  # devise_for :users, :controllers => { :sessions => 'devise/sessions',  :registrations => 'registrations' }, :skip => [:sessions] do
  #   get "/postuler" => "registrations#new", :as => :new_user_registration
  #   post "/postuler" => "registrations#create", :as => :user_registration
  # end
  get '/postuler' => 'home#page', page: 'postuler'

  # pages statiques
  get "/home" => "home#page", page: "home"
  get "/partenaires" => "home#page", page: "partenaires"
  get "/profs" => "home#page", page: "profs"
  get "/alumni" => "home#page", page: "alumni"
  get "/express" => "home#page", page: "express"
  get "/premiere" => "home#page", page: "premiere_classe"
  get "/wagon_bar" => "home#page", page: "wagon_bar"
  get "/thefamily" => "home#page", page: "koudetat"
  get "merci" => "home#merci" , :as => 'merci'
  get "presse" => "home#page", page: "presse"
  post "souscrire" => "home#subscribe"

  root to: "home#page", page: "home"

  ActiveAdmin.routes(self)

end
