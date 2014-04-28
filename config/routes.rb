FriendsCircle::Application.routes.draw do
  resources :users, only: [:create, :new, :edit, :update, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :circles
  resources :posts
end
