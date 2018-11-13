Rails.application.routes.draw do
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  get 'posts/index'
  get 'posts/new'
  post 'posts/create'
  delete 'posts/destroy'
  post 'comment/new'
  get 'posts/show'
  delete 'comment/delete'
  get 'comment/edit'
  patch 'comment/update'
end
