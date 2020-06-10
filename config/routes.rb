Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bloggers, only: [:new, :create, :show]
  resources :posts, only: [:new, :create, :edit, :update, :show] 
  get '/destinations/:id', to: 'destinations#show', as: "destination"
  post '/posts/:id', to: 'posts#like'
  
end
