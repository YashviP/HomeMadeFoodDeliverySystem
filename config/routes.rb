Rails.application.routes.draw do

  devise_for :users#,:controllers => {registrations: "registrations" }
  devise_for :customers#, :controllers => {registrations: "registrations" }
  devise_for :chefs
   
 # get '*path', to: 'errors#error_404', via: :all
  get 'subscriptions/main' , as: 'main'
  root 'visitors#index'
  resources :customer_subscriptions do
    collection do
         post 'subscribe'
    end
  end
  resources :subscriptions  do

    collection do

          get 'new_breakfast_dinner'
          get 'create_breakfast_dinner'
          get 'show_breakfast_dinner'
          get 'show_menu'
          get 'bd'
          get 'bld'
          get 'create_customer'
         

    end
   end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

 

