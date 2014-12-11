Rails.application.routes.draw do

  resources :languages

  resources :projects do
    resources :translation_entries do
      member do
        get :show_key
      end
      resources :translations
    end
  end
  devise_for :users

  root 'home#index'

  namespace :api do
    namespace :v1 do
      resources :projects, :only => [:show, :update]
    end
  end
end
