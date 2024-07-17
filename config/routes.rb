Rails.application.routes.draw do
  root 'homes#top'
  resources :books
  post 'homes', to: 'books#index'
end

