Rails.application.routes.draw do
  root to: 'home#index'
  resource :wechat, only: [:show, :create]
  devise_for :users, controllers: {
               omniauth_callbacks: 'users/omniauth_callbacks',
               registrations: 'users/registrations'
             }
end
