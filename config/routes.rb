Rails.application.routes.draw do

  resources :translation_revisions

  resources :project_languages

  resources :languages

  devise_for :users
  resources :users

  resources :project_users

  resources :projects do
    resources :translation_entries do
      member do
        get :show_key
      end
      resources :translations
    end
  end

  root 'home#index'

  namespace :api do
    namespace :v1 do
      resources :projects, :only => [:show, :update]
    end
  end
end
