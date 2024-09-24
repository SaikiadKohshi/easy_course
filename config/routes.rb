Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
     get 'aecsites/index' => 'aecsites#index'
     root 'aecsites#index' #ログイン機能でdeviseを使う時にこのコードは必須、なぜならログインした後のシーン遷移を決めないとroot_pathに移動してしまうから
  resources :aecsites do
     
     collection do
     
       get :profile
       get :universitylife
       get :tchcourcelist
       get :commoncource
       get :tlcource

       # 新規投稿画面
       get "aecsites/tchcourcelistnew" => "aecsites#tchcourcelistnew" #aecsites/tchcourcelistnewを受け取ったらaecsitesコントローラーのtchcourcelistnewに遷移するためのコード
       get "aecsites/commoncourcenew" => "aecsites#commoncourcenew"
       get "aecsites/tlcourcenew" => "aecsites#tlcourcenew" 
       #get :tchcourcelistnew, to: "aecsites#tchcourcelistnew" 簡潔バージョン
       #get :tchcourcelistnew, to: 'aecsites#tchcourcelistnew'
       #get :commoncourcenew, to: 'aecsites#commoncourcenew'
       #get :tlcourcenew, to: 'aecsites#tlcourcenew'

       #post "aecsites" => "aecsites#create" 
       #aecsites：aecsitesというURLに対してPOSTリクエストが発生した時に必要なコード
       #aecsites#create：aecsitescontorollerの中にあるcreateアクションを呼び出すために使われるコード
       post :create, to: 'aecsites#create'
     
     resources :commoncources do
      member do
        delete :destroy_commoncource
      end
     end
  
     resources :tchcourcelists do
      member do
        delete :destroy_tchcourcelist
      end
     end
  
     resources :tlcources do
      member do
        delete :destroy_tlcource
      end
     end

     end #collect doのend
  end
  

end
