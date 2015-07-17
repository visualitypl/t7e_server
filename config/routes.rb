Rails.application.routes.draw do

  resources :translation_revisions

  resources :languages

  devise_for :users
  resources :users

  resources :project_users do
    member do
      post :create_project_user
    end
  end

  resources :projects do
    resources :project_languages
    resources :translation_entries do
      member do
        get :show_key
      end
      collection do
        get :search
      end
      resources :translations
    end
  end

  root 'home#index'

  namespace :api do
    namespace :v1 do
      resources :projects, :only => [:show, :update] do
        member do
          get :show_gettext
          patch :update_gettext
          put :update_gettext
        end
      end
    end
  end
end
