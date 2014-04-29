FriendsCircle::Application.routes.draw do
  get 'feed', to: 'users#feed'
  resources :users, only: [:create, :new, :edit, :update, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :circles
  resources :posts
end
