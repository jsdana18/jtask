Rails.application.routes.draw do
  
  root 'task#index'

  # resources :user
  resources :task do
    collection do
      get :orderc
      get :ordere
      get :orderp
      # get :q, path: '/q/:order/:q'
      get :q
    end
  end

end
