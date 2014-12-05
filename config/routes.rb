Rails.application.routes.draw do
  resources :translations

  resources :languages

  resources :translation_entries

  devise_for :users

  root 'home#index'

  namespace :api do
    namespace :v1 do
      resources :projects, :only => [:show, :update]
    end
  end
end
