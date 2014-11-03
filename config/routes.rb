Rails.application.routes.draw do
  resources :tasks
  devise_for :users, controllers: {registrations: "users"}
  devise_scope :user do
    resources :users
  end
  root 'pages#home'
end
