Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  devise_scope :user do
    get '/login' => 'users/sessions#new'
    delete '/logout' => 'users/sessions#destroy'
  end
  root 'home#index'
end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
