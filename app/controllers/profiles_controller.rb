class ProfilesController < ApplicationController
    
    #applicationに「before_action :configure_permitted_parameters, if: :devise_controller?」があるため、ログインしてないと全てのviewが非表示になるように設定している
    #管理者だけしか表示してはいけないもの以外は未ログインでも表示できるように以下のコードを追従
    #before_action :authenticate_user!, except: [:index, :show] 
    
    #未ログイン者にそもそも見られないようにするためのコード
    #before_action :authenticate_user!

    #未ログイン者が編集、創作、更新ができないようにするためのコード
    before_action :authenticate_user!, only: [:edit, :create, :update]

    #ログインしたもの(クライアント)側が編集。更新ができないようにするためのコード
    before_action :set_profile, only: [:edit, :update]
    #後々、管理者権限を増やす時に登録はできるようにした(現段階では禁止している)

    #管理者のみ編集するためのコード
    #before_action :authenticate_admin, only: [:edit, :update]
    before_action :authorize_admin, only: [:edit, :update]
  
    def index
      @profiles = Profile.all
    end
    
    def new
      @profile = Profile.new
    end


    def edit
       #@profile = Profile.find(params[:id])
       #redirect_to aecsites_index_path, alert: "アクセス権がありません" unless current_user.id == @profile.user_id # 他のユーザーのプロフィール編集ページにアクセスできないように制御
        #これがないとホームに戻ることができない(ここではviews/profiles/index.htmlからviews/aecsites/indexに遷移できないことを表す)
    end

    def create
       @profile = Profile.new(profile_params)

       #管理者権限
       #@proflie.user_id = current_user.id

       # 管理者が設定された場合(管理者権限)
       #@profile.user_id = current_user.id if user_signed_in?


       # 管理者がログインしている場合、user_idを設定
       if user_signed_in?
         @profile.user_id = current_user.id
       end

       if @profile.save
         redirect_to :action => "index"
       else
         #redirect_to :action => "new"
         #render :new, alert: 'プロフィールの作成に失敗しました。'
         render :new, alert: 'プロフィールの作成に失敗しました。'  # エラーメッセージを表示するためにrenderを使用
       end
    end
 
    def update
       #profile = Profile.find(params[:id])
       if @profile.update(profile_params)
         redirect_to :action => "index"
       else 
         #redirect_to :action => "edit"
         render :edit, alert: 'プロフィールの更新に失敗しました。'
       end
    end
    
    
  
    private

    #def set_profile
     # @profile = Profile.find(params[:id])
    #end
  
    #def authorize_user
     # redirect_to aecsites_index_path, alert: "アクセス権がありません" unless current_user.id == @profile.user_id
    #end

    def set_profile
      @profile = Profile.find(params[:id])
    end  

    def authorize_admin
      # 自分のプロフィール、もしくは管理者のみが編集できる
      unless current_user.id == @profile.user_id || current_user.admin?
        redirect_to profiles_path, alert: "アクセス権がありません"
      end
    end

    def profile_params
        params.require(:profile).permit(:nickname, :age, :birthday, :hometown, :college, :character)
    end

    

end
