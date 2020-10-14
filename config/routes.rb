Rails.application.routes.draw do

  #会員側devise
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }

  #管理者側devise
  devise_for :admins, controllers: {
    sessions: "admins/sessions",
  }

  get root 'homes#top'
  get 'about' => 'homes#about'

  #会員側
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
      get 'confirm' => 'users#confirm'
      patch '/withdraw' => 'users#withdraw'
      resources :artists, only: [:index, :create, :destroy]
      resource :relationships, only: [:create, :destroy]
      resources :contacts, only: [:create]
      resources :chats, only: [:show, :create]
    end
    get 'index' => 'search#index'
    get 'search' => 'search#search'
    get 'kanto' => 'search#kanto'
    get 'hokkaido' => 'search#hokkaido'
    get 'tohoku' => 'search#tohoku'
    get 'chubu' => 'search#chubu'
    get 'kinki' => 'search#kinki'
    get 'chugoku_shikoku' => 'search#chugoku_shikoku'
    get 'kyusyu_okinawa' => 'search#kyusyu_okinawa'
  end

  #管理者側
  resources :events, only: [:index, :edit, :create, :update, :destroy]
  resources :users, only: [:index]
  resources :contacts, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
