Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :decks do
      resources :cards
    end
  end

  resources :decks, only: :index do
    resources :repetitions, only: [:new, :create]
  end

  resources :repetitions, only: :index

  root 'welcome#index'

end
