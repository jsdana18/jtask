Rails.application.routes.draw do
  
  root 'task#index'

  # resources :user
  resources :task

end
