Rails.application.routes.draw do
  resources :topics, only: [:index, :show]
  get 'topics/index'
  get 'topics/show'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :portfolios, except: [:show] do 
    put :sort, on: :collection
  end

  get 'angular', to: 'portfolios#angular'
  get 'portfolio/:id', to: 'portfolios#show', as: 'show_portfolio'
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'
  resources :blogs do
    member do
      get :toggle_status
    end
  end
  mount ActionCable.server => '/cable' 
  #going to open upa web socket connection that we can use in order to connect in and send data receive data
  root to: 'pages#home'
end
