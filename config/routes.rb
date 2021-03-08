Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  devise_for  :users

  resources   :ingredients,       except: [:show, :destroy]

  resources   :recipes do
    resources   :doses,             only: [:create]
    resources   :shopping_lists,    only: [:create, :update]
  end

  resources   :doses,             only: [:destroy]

  resources   :shopping_lists,    only: [:index]
  delete      'shopping_lists',   to: 'shopping_lists#destroy_all'

  # get     'recipes',                  to: 'recipes#index'
  # get     'recipes/new',              to: 'recipes#new',      as: :new_recipe
  # post    'recipes',                  to: 'recipes#create'
  # get     'recipes/:id',              to: 'recipes#show',     as: :recipe
  # get     'recipes/:id/edit',         to: 'recipes#edit',     as: :edit_recipe
  # patch   'recipes/:id',              to: 'recipes#update'
  # delete  'recipes/:id',              to: 'recipes#destroy'
end
