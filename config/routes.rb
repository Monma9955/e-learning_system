Rails.application.routes.draw do
  devise_for :users

  root to: 'categories#index'

  resources :categories, only: [:index, :show]
  resources :articles, only: [:new, :create] do
    collection do
      get 'get_category_parents', defaults: { format: 'json' }
      get 'get_category_children', defaults: { format: 'json' }
    end
  end
end
