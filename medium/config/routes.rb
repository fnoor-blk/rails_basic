Rails.application.routes.draw do
  root 'blogs#index'
  resources :blogs,except: [:index] do
    collection do
      get 'my',to:'blogs#my_blogs'
    end
  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
