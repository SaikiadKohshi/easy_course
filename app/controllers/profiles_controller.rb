class ProfilesController < ApplicationController
    #before_action :set_profile, only: %i[edit update]
    #before_action :authorize_user, only: :edit    

    def index
      @profiles = Profile.all
    end
    
    def new
      @profile = Profile.new
    end


    def edit
       @profile = Profile.find(params[:id])
       #redirect_to aecsites_index_path, alert: "アクセス権がありません" unless current_user.id == @profile.user_id # 他のユーザーのプロフィール編集ページにアクセスできないように制御
        #これがないとホームに戻ることができない(ここではviews/profiles/index.htmlからviews/aecsites/indexに遷移できないことを表す)
    end

    def create
       @profile = Profile.new(profile_params)
       if @profile.save
         redirect_to :action => "index"
       else
         redirect_to :action => "new"
         #render :new, alert: 'プロフィールの作成に失敗しました。'
       end
    end
 
    def update
       profile = Profile.find(params[:id])
       if profile.update(profile_params)
         redirect_to :action => "index" , :id => profile.id
       else 
         redirect_to :action => "edit"
         #render :edit, alert: 'プロフィールの更新に失敗しました。'
       end
    end

    private

    #def set_profile
     # @profile = Profile.find(params[:id])
    #end
  
    #def authorize_user
     # redirect_to aecsites_index_path, alert: "アクセス権がありません" unless current_user.id == @profile.user_id
    #end

    def profile_params
        params.require(:profile).permit(:nickname, :age, :birthday, :hometown, :college, :character)
    end

end
