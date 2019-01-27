Rails.application.routes.draw do
  devise_for :users

  root "home#welcome"
  resources :genres, only: :index do
    member do
      get "movies"
    end
  end
  resources :movies, only: [:index, :show] do
    member do
      get :send_info
    end
    collection do
      get :export
    end
  end

  scope :api do
    scope :v1 do
      get "movies_list", to: "movies#movies_list", as: :movies_list
      get "movie/:id", to: "movies#movie", as: :movie_data
    end

    scope :v2 do
      get "movie_list", to: "movies#movies_list_with_genre", as: :movies_list_with_genre
    end
  end

  resources :comments, only: [:create, :destroy] do
    collection do
      get 'top_commenters', to: 'comments#top_commenters', as: :top_commenters
    end
  end
end
