Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
     get 'aecsites/index' => 'aecsites#index'
     root 'aecsites#index'
  resources :aecsites do
     
     collection do
     
     get :profile
     get :universitylife
     get :tchcourcelist
     get :commoncource
     get :tlcource
     
     end
  end
  

end
