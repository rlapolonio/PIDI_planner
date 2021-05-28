Rails.application.routes.draw do
  root 'welcome#index'
  get '/' => 'welcome#index'
  resources :categories do
    resources :tasks
  end
end
