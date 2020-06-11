Rails.application.routes.draw do
  resources :bloggers
  resources :destinations
  resources :posts

  post 'posts/:id/liked', to: 'posts#like', as: "like"

end
