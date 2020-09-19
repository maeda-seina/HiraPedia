Rails.application.routes.draw do

  namespace :users do
    root 'home#top'
    get 'about' => 'home#about'
    post '/guest_sign_in' => 'home#guest'
    get 'inquiry/index' => 'inquiry#index'
    get 'inquiry/confirm' => 'inquiry#confirm'
    post 'inquiry/confirm' => 'inquiry#confirm'
    get 'inquiry/thanks' => 'inquiry#thanks'
    post 'inquiry/thanks' => 'inquiry#thanks'
    resources :notifications, only: :index
    resources :messages,only: [:create]
    resources :rooms,only: [:create, :show, :index]
    resources :users,only: [:show,:edit,:update,:index] do
      resource :relationships, only: [:create, :destroy]
      get :follows, on: :member
      get :followers, on: :member
    end
    resources :facilities,only: [:index,:show]
    resources :post do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments,only: [:create,:destroy]
    end
  end



  namespace :admins do
    resources :facilities
  end

  namespace :users do
    resources :facilities,only: [:index,:show]
  end


  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations',
  omniauth_callbacks: 'users/omniauth_callbacks'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
