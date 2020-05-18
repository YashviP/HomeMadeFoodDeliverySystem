require 'sidekiq/web'
Rails.application.routes.draw do
  
  mount Notifications::Engine => "/notifications"
  get 'notifications/index'
  default_url_options :host => "127.0.0.1:3000"



  devise_for :users 
  devise_for :customers 

  devise_for :chefs 

   
 #get '*path', to: 'errors#error_404', via: :all

  get 'subscriptions/main' , as: 'main'

  root 'visitors#index'
  resources :customer_subscriptions do
    collection do
         post 'subscribe'
         get 'contact'
         get 'time'
    end
  end
  resources :links do 
    collection do
      get 'login'
    end
  end

  
  resources :subscriptions  do

    patch :inactive, on: :member

    patch :active, on: :member

    member do
        patch :toggle_enable_status
    end
  

    collection do

          get 'new_breakfast_dinner'
          get 'create_breakfast_dinner'
          get 'show_breakfast_dinner'
          get 'create_customer'
          get 'all'
          get 'display_customers'
          get 'menu/:id', to: 'subscriptions#menu', as: 'menu'
          post 'list/:id', to: 'subscriptions#list', as: 'list'
          
         
         
    end
  end


  mount ActionCable.server => '/cable'
  mount Sidekiq::Web => '/sidekiq'

  resources :notifications, only: [:index, :update]

 
end

 

