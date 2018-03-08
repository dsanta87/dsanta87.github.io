Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'boda#home'
  get 'boda/home'
  get 'boda/who_we_are'
  get 'boda/place'
  get 'boda/help'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
