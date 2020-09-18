Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  get root 'homes#top'
  get 'about' => 'homes#about'

  namespace :user do
  	resources :events, only: [:index, :show]
  end

  resources :events, only: [:index, :show, :create, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
