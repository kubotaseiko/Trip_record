Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'homes#top'
  get '/search' => 'spots#search'


  resources 'trips', only: [:index, :show, :edit, :update, :create, :destroy] do
    resources 'spots', only: [:show, :edit, :update, :new, :create, :destroy] do
      resource 'favorite', only: [:create, :destroy]
    end
  end

resources 'lists', only: [:index, :edit, :update, :create, :destroy]

  get 'spots' => 'spots#index'

  resources :tags do
    get 'spots', to: 'spots#tag_search'
  end

  get 'trips_search' => 'trips#search'
  get 'calendar' => 'trips#calendar'
  get 'favorite_all' => 'favorites#favorite_all'

  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'

end
