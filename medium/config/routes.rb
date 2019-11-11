Rails.application.routes.draw do
  root 'blogs#index'
  get 'blogs/show'
  get 'blogs/new'
  get 'blogs/create'
  get 'blogs/update'
  get 'blogs/edit'
  get 'blogs/delete'
  get 'blogs/destroy'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
