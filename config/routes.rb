Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
     get 'aecsites/index' => 'aecsites#index'
     root 'aecsites#index' #ログイン機能でdeviseを使う時にこのコードは必須、なぜならログインした後のシーン遷移を決めないとroot_pathに移動してしまうから
  resources :aecsites do
     
     collection do
     
       #get :profile
       #get :universitylife
       #get :tchcourcelist
       get :commoncource
       #get :tlcource
       

       # 新規投稿画面
       #get "aecsites/tchcourcelistnew" => "aecsites#tchcourcelistnew" #aecsites/tchcourcelistnewを受け取ったらaecsitesコントローラーのtchcourcelistnewに遷移するためのコード
       get "aecsites/commoncourcenew" => "aecsites#commoncourcenew"
       #get "aecsites/tlcourcenew" => "aecsites#tlcourcenew" 




       #下のコードがないと投稿するボタンを押すと「NoMethodError in Aecsites#tlcource」  <%= button_to 'Delete', destroy_tlcource_aecsites_path(t.id), method: :delete, data: { confirm: '本当に削除しますか？' } %>というエラーと内容が出る
       #ただ、投稿内容は残るので正確には投稿した後のシーン遷移ができないだけ
       #delete 'commoncource/:id', to: 'aecsites#destroy_commoncource', as: 'destroy_commoncource'
       #delete 'tchcourcelist/id', to: 'aecsites#destroy_tchcourcelist', as: 'destroy_tchcourcelist'
       #delete 'tlcource/:id', to: 'aecsites#destroy_tlcource', as: 'destroy_tlcource' #TlcourceControllerを使わずにAexsitesControllerで削除機能を実装できるために直接消すリンク先をここに書いた



       #resources :tlcources, only: [:tlcource, :tlcourcenew, :create, :destroy] 
       #get 'tlcources/:id', to: 'tlcources#tlcource', as: 'tlcource'
       
       #get :tchcourcelistnew, to: "aecsites#tchcourcelistnew" 簡潔バージョン
       #get :tchcourcelistnew, to: 'aecsites#tchcourcelistnew'
       #get :commoncourcenew, to: 'aecsites#commoncourcenew'
       #get :tlcourcenew, to: 'aecsites#tlcourcenew'

       #post "aecsites" => "aecsites#create" 
       #aecsites：aecsitesというURLに対してPOSTリクエストが発生した時に必要なコード
       #aecsites#create：aecsitescontorollerの中にあるcreateアクションを呼び出すために使われるコード
       #post :create, to: 'aecsites#create'

       #post 'commoncource', on: :collection
       #post 'tchcourcelist', on: :collection
       #post 'tlcources', on: :collection 
       #post 'create_tlcource', on: :collection #電子情報工学科のサイト投稿する時に使うコード
       #下のpostメソッドがないと例えば電子情報工学科サイト内の投稿するボタンを押す時、「NameError in Aecsites#tlcourcenew」、<%= form_with model: @tlcource, url: create_tlcource_aecsites_path do |post| %>のエラーと内容が出る
       post :create_commoncource
       #post :create_tchcourcelist
       #post :create_tlcource

    end #collect doのend



    #共通教養科目の削除機能追加
    member do
     delete :destroy_commoncource 
      #この「destroy_commoncource」をコントローラーで「def destroy_commoncource」と
      #書くことで、削除機能ができるようになる
      #正確には削除機能を呼び出すルートが設定され、コントローラー内の対応するアクションで削除処理を実行することができる 

      #この「destroy_commoncource」をルーティング内で指定することで、
      #コントローラーに同名のアクション「def destroy_commoncource」を実装すれば
      #削除機能が動作するようになります。

      #なぜそうなるか：
      #delete :destroy_commoncource は、HTTPのDELETEリクエストを送るためのルートを定義します。このルートは、aecsites/:id/destroy_commoncource というURLパターンにマッチします。
      #destroy_commoncource がコントローラーに実装されている場合、そのアクションが呼ばれます。このアクションでデータベースのレコードを削除し、削除後にリダイレクトやメッセージを表示します。
    end
  end

  #電子情報工学科のリンク先を示す全体のコード
  resources :tlcources do
    member do
      delete :destroy #電子情報工学科の投稿削除機能追加
    end
  end
  
   #工学科共通科目のリンク先を示す全体のコード
   resources :tchcourcelists do
    member do
      delete :destroy
    end
   end


   #大学生活のリンク先を示す全体のコード
   resources :universitylives do
     collection do
      get :intrograde
      get :firsty
      get :secondy
      get :thirdy
      get :fourthy
     
     end
     
     
   end

    #大学1年生の機能を実装する全体のコード


    #大学2年生の機能を実装する全体のコード


    #大学3年生の機能を実装する全体のコード


    #大学4年生の機能を実装する全体のコード
    
    #制作者のリンク先を示す全体のコード
    resources :profiles do
      
    end

        #collection do
          
          #get :tlcource
          #get :tlcourcenew  # 新規作成画面
          #post :create_tlcource  # 新規作成
        #end #collect doのend
end

       #post 'create_tlcource', to: 'aecsites#create' #電子情報工学科のサイト投稿する時に使うコード

     #resources :commoncources do
      #member do
       # delete :destroy_commoncource
      #end
     #end
  
     #resources :tchcourcelists do
      #member do
       # delete :destroy_tchcourcelist
      #end
     #end
  
     #resources :tlcources do
      #member do
       #  delete :destroy_tlcource, as: 'destroy'
      #end
     #end


