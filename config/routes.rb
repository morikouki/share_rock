Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }
  devise_for :admins, controllers: {
    sessions: "admins/sessions",
  }

  get root 'homes#top'
  get 'about' => 'homes#about'

  namespace :user do
  	resources :events, only: [:index, :show] do
  	  resources :posts, only: [:index, :show, :create, :update, :destroy] do
        resource :favorites, only: [:create, :destroy]
        resources :post_comments, only: [:create, :update, :destroy] do
          resource :comment_favorites, only: [:create, :destroy]
          resources :replay_comments, only: [:create, :destroy]
        end
      end
    end
    resources :users, only: [:show, :edit, :update] do
      resources :artists, only: [:create, :edit, :update, :destroy]
      resource :relationships, only: [:create, :destroy]
    end
    get 'search' => 'search#search'
    get 'index' => 'search#index'
    get 'kanto' => 'search#kanto'
    get 'hokkaido' => 'search#hokkaido'
    get 'tohoku' => 'search#tohoku'
    get 'chubu' => 'search#chubu'
    get 'kinki' => 'search#kinki'
    get 'chugoku_shikoku' => 'search#chugoku_shikoku'
    get 'kyusyu_okinawa' => 'search#kyusyu_okinawa'
  end

  resources :events, only: [:index, :edit, :create, :update, :destroy]
  resources :users, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
