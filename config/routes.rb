Rails.application.routes.draw do
  get 'mypage', to: 'users#me'
  post 'login', to: 'session#create'
  delete 'logout', to: 'sessions#destroy'
  
  root 'home#index'
  resources :users, only: %i[new create]
  resources :boards, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: %i[create destroy]
  end
end