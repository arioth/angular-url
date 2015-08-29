Rails.application.routes.draw do

  root 'home#index'

  namespace :api do
    resources :urls, only: [:index, :create]
  end

end
