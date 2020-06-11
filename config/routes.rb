Rails.application.routes.draw do
  get 'posts/index'

  get 'posts/show'

  get 'posts/new'

  get 'posts/create'

  get 'posts/edit'

  get 'posts/update'

  get 'bloggers/show'

  get 'bloggers/new'

  get 'bloggers/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :destinations, only: [:show]
  resources :bloggers, only: [:new,:create,:show]
  resources :posts
end
