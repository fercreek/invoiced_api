# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  namespace :v1, defaults: { format: :json } do
    scope ':account_id' do
      resources :contacts, only: %i[index]

      resources :organizations, only: %i[create update] do
        resources :contacts, only: %i[create update]
      end
    end

    resources :accounts, only: %i[create update]
    resources :sessions, only: %i[create destroy show]
    resources :users, only: %i[create]
  end
end
