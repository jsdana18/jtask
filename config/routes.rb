Rails.application.routes.draw do
  
  root 'task#index'

  # resources :user
  resources :task do
    collection do
      get :odate
      get :edate
      post :q
    end
  end

end
