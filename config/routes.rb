Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  get '/' => 'welcome#index'
  resources :categories do
    resources :tasks
  end
end
