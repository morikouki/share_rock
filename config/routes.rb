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
        resources :post_comments, only: [:create, :edit, :update, :destroy]
      end
    end
    resource :users, only: [:edit, :update] do
      collection do
        get 'my_page' => 'users#my_page'
      end
    end
  end

  resources :events, only: [:index, :show, :create, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
