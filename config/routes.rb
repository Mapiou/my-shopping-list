Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get 'recipes', to: 'recipes#index'
  get 'recipes/new', to: 'recipes#new'
  post 'recipes', to: 'recipes#create'
end
