Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "users"}
  devise_scope :user do
    resources :users do
      resources :tasks
    end
  end
  root 'pages#home'
end
