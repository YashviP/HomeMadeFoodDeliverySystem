Rails.application.routes.draw do

  devise_for :users#,:controllers => {registrations: "registrations" }
  devise_for :customers#, :controllers => {registrations: "registrations" }
  devise_for :chefs

  root 'visitors#index'
  #resources :users
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
