Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'

  resources :recipes do
    resources :doses, only: [:create]
    resources :shopping_lists, only: [:create]
  end
  resources :doses, only: [:destroy]

  resources :shopping_lists, only: [:index]

  # get     'recipes',                  to: 'recipes#index'
  # get     'recipes/new',              to: 'recipes#new',      as: :new_recipe
  # post    'recipes',                  to: 'recipes#create'
  # get     'recipes/:id',              to: 'recipes#show',     as: :recipe
  # get     'recipes/:id/edit',         to: 'recipes#edit',     as: :edit_recipe
  # patch   'recipes/:id',              to: 'recipes#update'
  # delete  'recipes/:id',              to: 'recipes#destroy'

  # post    'recipes/:recipe_id/doses', to: 'doses#create',     as: :recipe_doses
  # delete  'doses/:id',                to: 'doses#destroy'
end
