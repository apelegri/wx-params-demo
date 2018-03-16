Rails.application.routes.draw do
  root to: 'home#index'
  get '/page', to: 'home#page'
  devise_for :users, controllers: {
               omniauth_callbacks: 'users/omniauth_callbacks',
               registrations: 'users/registrations'
             }
end
