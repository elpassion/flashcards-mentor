Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :decks do
      resources :cards
    end
  end

  resources :decks, only: :index

  root 'welcome#index'
end
