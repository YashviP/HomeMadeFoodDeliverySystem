Rails.application.routes.draw do
  devise_for :users
  devise_for :customers
  devise_for :chefs
  get :protected, to: 'visitors#protected'
  root 'visitors#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
