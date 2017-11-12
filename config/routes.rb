Rails.application.routes.draw do
  root to: "artists#index"
  resources :artists do
    resources :songs
  end
  resources :pictures, only: [:destroy]
  get "sort" => "artists#index_sort"
  get "sort_des" => "artists#index_sort_des"
  # post "artists" => "artists#index_sort"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
