Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }
  devise_for :admins, controllers: {
    registrations: 'admins/registrations',
    sessions: "admins/sessions",
  }

  get root 'homes#top'
  get 'about' => 'homes#about'

  namespace :user do
  	resources :events, only: [:index, :show] do
  	  resources :posts, only: [:show, :create, :edit, :update, :destroy] do
        resource :favorites, only: [:create, :destroy]
        resources :post_comments, only: [:create, :edit, :update, :destroy] do
          resource :comment_favorites, only: [:create, :destroy]
        end
      end
    end
    resources :users, only: [:show, :edit, :update] do
      resource :relationships, only: [:create, :destroy]
      get 'follower' => 'relationships#follower', as: 'follower'
      get 'folowing' => 'relationships#following', as: 'followings'
    end
    get 'search' => 'search#search'
  end

  resources :events, only: [:index, :show, :create, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
