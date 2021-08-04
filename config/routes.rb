Rails.application.routes.draw do
  get 'articles/approval_requests'
  get 'articles/approve/:id', to: 'articles#approve', as: :approve
  get 'home/index'
  devise_for :journalists
  resources :articles, :except => [:edit, :update]
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
