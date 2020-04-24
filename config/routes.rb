Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  
  #フォロー中のユーザとフォローされているユーザ一覧表示
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
    end
  end

  resources :microposts, only: [:create, :destroy]
  
  #ログインユーザがユーザをフォロー/アンフォローできるようにするルーティング
  resources :relationships, only: [:create, :destroy]
  
  #ふぁぼ一覧表示
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :likes
    end
  end
  
  #ログインユーザが投稿をfav/unfavできるようにするルーティング
  resources :favorites, only: [:create, :destroy]
end
