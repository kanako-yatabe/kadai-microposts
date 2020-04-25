Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  
  #フォロー中のユーザとフォローされているユーザ一、お気に入り覧表示
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
      get :likes
    end
  end

  resources :microposts, only: [:create, :destroy]
  
  #ログインユーザがユーザをフォロー/アンフォローできるようにするルーティング
  resources :relationships, only: [:create, :destroy]
  
  
  #ログインユーザが投稿をfav/unfavできるようにするルーティング
  resources :favorites, only: [:create, :destroy]
end
