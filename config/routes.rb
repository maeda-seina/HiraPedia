Rails.application.routes.draw do
  namespace :admins do
    get 'facilities/create'
    get 'facilities/index'
    get 'facilities/show'
    get 'facilities/edit'
    get 'facilities/update'
  end
  namespace :users do
    get 'users/show'
    get 'users/edit'
    get 'users/update'
  end
  namespace :users do
    get 'relationships/create'
    get 'relationships/destroy'
  end
  namespace :users do
    get 'post_comments/create'
    get 'post_comments/destroy'
  end
  namespace :users do
    get 'favorites/create'
    get 'favorites/destroy'
  end
  namespace :users do
    get 'facilities/index'
    get 'facilities/show'
  end
  namespace :users do
    get 'post/index'
    get 'post/show'
    get 'post/create'
    get 'post/update'
    get 'post/edit'
    get 'post/destroy'
  end
  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
