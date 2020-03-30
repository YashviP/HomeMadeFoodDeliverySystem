Rails.application.routes.draw do

  devise_for :users#,:controllers => {registrations: "registrations" }
  devise_for :customers#, :controllers => {registrations: "registrations" }
  devise_for :chefs
   
  get 'subscriptions/main' , as: 'main'
  root 'visitors#index'
  resources :subscriptions  do

    collection do

          get 'new_breakfast_dinner'
          get 'create_breakfast_dinner'
          get 'show_breakfast_dinner'
     

    end
   end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
