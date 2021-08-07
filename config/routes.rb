Rails.application.routes.draw do
  
  root 'task#index'

  # resources :user
  resources :task do
    collection do
      get :odate
      get :edate
      # get :q, path: '/q/:order/:q'
      get :q
    end
  end

end
