class AecsitesController < ApplicationController


    #このディレクトリ内にある色の意味
    #緑色：db/migrate内に格納されているモデルの名前を指している
    #水色：変数。この変数はviewで反映したい時に共通言語として使う。例、@aaとつけたらhtmlでも@aaと定めてそこから投稿や編集機能に反映させる
    def index
       @commoncource=Aecsite.all
    end
    #def profile
    #end
    #def universitylife
    #end
    #def tchcourcelist
     #   @tchcourcelists=Aecsite.all #db/migrate/生年月日_~Aecsiteモデル内にあるカラムを@tchcourcelistに代入する時に使うコード
    #end
    def commoncource
        @commoncources=Aecsite.all
    end
    #def tlcource
     #   @tlcources=Aecsite.all
    #end
    
    
    def commoncourcenew
        @commoncource=Aecsite.new
    end
    

    #def tchcourcelistnew
     #   @tchcourcelist=Aecsite.new
    #end

    #def tlcourcenew
    #end
    #def tlcourcenew
     # @tlcource = Tlcource.new 
    #end
    
    #def create
      # どのモデルの投稿かを判別するための強化
     # if params[:model] == "tlcource"
      #  @tlcource = Tlcource.new(tlcource_params)
       # if @tlcource.save
        #  redirect_to tlcource_path(@tlcource), notice: 'Tlcourceを投稿しました'
       # else
        #  render :tlcourcenew
       # end
     # end
    #end
    
    #共通教養科目の投稿処理
  def create_commoncource
    @commoncource = Aecsite.new(commoncource_params)
    @commoncource.user_id = current_user.id  # ログインユーザーのIDを設定
    if @commoncource.save
      redirect_to commoncource_aecsites_path, notice: 'Commoncourceを投稿しました'
    else
      render :commoncourcenew
    end
  end

  #工学科共通科目の投稿処理
  #def create_tchcourcelist
   # @tchcourcelist = Aecsite.new(tchcourcelist_params)
    #if @tchcourcelist.save
     # redirect_to tchcourcelist_aecsites_path, notice: 'Tchcourcelistを投稿しました'
    #else
     # render :tchcourcelistnew
    #end
  #end

  #電子情報工学科の投稿処理
  #def create_tlcource
   # @tlcource = Aecsite.new(tlcource_params)
    #if @tlcource.save
     # redirect_to tlcource_aecsites_path, notice: 'Tlcourceを投稿しました'
    #else
     # render :tlcourcenew
    #end
  #end









    

    #共通教養科目の削除機能
     def destroy_commoncource
     #def destroy
        #find_by(id: params[:id]) は、指定された id に一致する Aecsite オブジェクトをデータベースから探し、
        #もし見つからなければ nil を返します。find を使うと見つからなかった場合に例外が発生しますが、find_by ではそのような例外は発生しません。
        @commoncource = Aecsite.find_by(id: params[:id])

        #present? メソッドは、オブジェクトが nil または空でない場合に true を返すので、
        #@commoncource が存在しているかどうかをチェックするために使用しています。
        #もし @commoncource が存在すれば、削除処理を実行し、存在しなければエラーメッセージを表示します。
        if @commoncource.present?

           #下のdestroy メソッドは、データベースから対象レコードを削除します。これにより、対象の Aecsite オブジェクトが削除されます。
           @commoncource.destroy

            redirect_to commoncource_aecsites_path, notice: "投稿が削除されました"
        else
            redirect_to commoncource_aecsites_path, alert: "投稿が見つかりません"
        end
     #なぜ上のコードがうまくいくのか?
     #なぜこの方法がうまくいったか?
     #find_by の使用: find_by を使うことで、もし指定した id の投稿が見つからない場合でもエラーが発生せず、安全に処理を続けられます。
     #present? によるチェック: present? を使って、オブジェクトが存在するかどうかを確認し、存在しない場合に適切なエラーメッセージを表示できるようにしています。
     #リダイレクトとメッセージの表示: 削除成功や失敗に応じて適切なメッセージを表示し、ユーザーにフィードバックを提供しています。


        #@commoncource = Aecsite.find(params[:id])
        #if @commoncource
         # @commoncource.destroy
          #  redirect_to commoncources_aecsites_path, notice: "投稿が削除されました"
        #else
          #  redirect_to commoncource_aecsites_path, alert: "投稿が見つかりません"
        #end
      
        #@commoncource = Aecsite.find(params[:id])
        #@commoncource.destroy
        #redirect_to commoncources_aecsites_path, notice: "投稿が削除されました"
        
    
        #if commoncource
         # commoncource&.destroy #「&.」は存在しないデータベースによるエラーを防げる
         # redirect_to commoncources_aecsites_path, notice: "投稿が削除されました"
        #else
          # redirect_to commoncource_aecsites_path, alert: "投稿が見つかりません"
        #end
      end

    #工学科共通科目の削除機能
    #def destroy_tchcourcelist
     #   tchcourcelist = Aecsite.find_by(id: params[:id])
    
      #  if tchcourcelist
       #   tchcourcelist&.destroy
        #  redirect_to tchcourcelists_aecsites_path, notice: "投稿が削除されました"
      #  else
        #  redirect_to tchcourcelists_aecsites_path, alert: "投稿が見つかりません"
     #   end
    #end

    #電子情報工学科の削除機能
    #def destroy_tlcource
     #   tlcource = Aecsite.find_by(id: params[:id])
    
      #  if tlcource
       #   tlcource&.destroy
        #  redirect_to tlcources_aecsites_path, notice: "投稿が削除されました"
       # else
        #  redirect_to tlcources_aecsites_path, alert: "投稿が見つかりません"
       # end
    #end
    #1. 共通の削除メソッドを使用
    #destroy_aecsite メソッドを再利用して、各削除アクションで使用できるようにします。また、共通のルーティングで扱えるようにします。
    # 投稿した後、削除ボタンを押して削除できるための共通削除機能を利用する削除アクション
    #def destroy_commoncource
     #  destroy_aecsite(params[:id], commoncource_aecsites_path)
    #end

    #def destroy_tchcourcelist
     #  destroy_aecsite(params[:id], tchcourcelist_aecsites_path)
    #end

    #def destroy_tlcource
     #  destroy_aecsite(params[:id], tlcource_aecsites_path)
    #end


    private

    #def aecsite_params
     #   params.require(:aecsite).permit(:lecture, :professor, :grade, :reportage)
    #end

    # 投稿した後、削除ボタンを押して削除できるための共通削除メソッド
    #def destroy_aecsite(id, redirect_path)
     # aecsite = Aecsite.find_by(id: id)
    
      #if aecsite
       # aecsite.destroy
       # redirect_to redirect_path, notice: "投稿が削除されました"
      #else
       # redirect_to redirect_path, alert: "投稿が見つかりません"
      #end
    #end

    def commoncource_params
        params.require(:aecsite).permit(:lecture, :professor, :grade, :reportage, :user_id)
    end

    #def tchcourcelist_params
     #   params.require(:aecsite).permit(:lecture, :professor, :grade, :reportage)
    #end

    #def tlcource_params
     #   params.require(:aecsite).permit(:lecture, :professor, :grade, :reportage)
    #end



    #def destroy_aecsite(id, redirect_path)
     #   aecsite = Aecsite.find_by(id: id)
    
      #  if aecsite
       #   aecsite.destroy
       #   redirect_to redirect_path, notice: "投稿が削除されました"
      #  else
       #   redirect_to redirect_path, alert: "投稿が見つかりません"
      #  end
    #end


end
