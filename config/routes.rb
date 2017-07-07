Rails.application.routes.draw do

  ActiveAdmin.routes(self)
    devise_for :users
    as :user do
        get 'signin' => 'devise/sessions#new'
        delete 'signout' => 'devise/sessions#destroy'
        get 'signup' => 'devise/registrations#new'
    end

  resources :questions do
    member do
      post 'like', to: 'likes#create'
      delete 'unlike', to: 'likes#destroy'
    end
  end    
  resources :answers

  get 'users/:username',  to:'users#show', as: 'user'

  
    root 'pages#home'
    get 'about' => 'pages#about' 
    get 'contact' => 'pages#contact'

    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
