class UniversitylivesController < ApplicationController

     #1~4年生を選択するサイト
     def intrograde
     end

     #新規投稿機能
     def new
        @universitylife = Universitylife.new
     end

     #新規投稿機能の中身
     def create
        #@universitylife = current_user.universitylives.build(universitylife_params) # user_id を自動でセット
        @universitylife = Universitylife.new(universitylife_params)
        @universitylife.user_id =current_user.id #ログインユーザーのIDを設定
        if @universitylife.save
          redirect_to intrograde_universitylives_path, notice: 'UniversityLifeを投稿しました'
        else
          #実験コード
          puts @universitylife.errors.full_messages  # エラーメッセージをログに出力
          flash.now[:alert] = @universitylife.errors.full_messages.join(", ") # 画面にもエラー表示
          render :new
        end
     end

     #削除機能
     def destroy
        @universitylife = Universitylife.find(params[:id])

        # 投稿者でなければ削除できないようにする
        if @universitylife.user == current_user
            @universitylife.destroy
            redirect_to action: :intrograde, notice: '投稿を削除しました。'
        else
            redirect_to action: :intrograde, alert: 'この投稿を削除する権限がありません。'
        end
     end


     #大学1年生を紹介するサイト
     def firsty

        #投稿するサイトを選択し、投稿内容を示すためのコード
         @firsty=Universitylife.where(selsect:"firsty")

        #検索を投稿者ごとに制限したい場合
        #もし「ログインユーザーの投稿だけ検索したい」なら、以下のように where(user_id: current_user.id) を追加する必要があります。
        #これを入れると「ログイン中のユーザーが投稿したものだけ」を検索対象にすることができます。
         #@firsty = Universitylife.where(selsect: "firsty", user_id: current_user.id)
          

        #検索機能
        #複数検索はチェックボックスを使い、単体のみで検索するのはラジオボタンを使う
        @search_executed_1 = params[:filters].present? # || params[:search].present? # 検索が実行されたか判定　
         if @search_executed_1
          conditions = []
          conditions << "(study IS NOT NULL AND study != '' )" if params[:filters].include?('study')
          conditions << "(parttimejob IS NOT NULL AND parttimejob != '' )" if params[:filters].include?('parttimejob')
          conditions << "(circle IS NOT NULL AND circle != '' )" if params[:filters].include?('circle')
          conditions << "(daily IS NOT NULL AND daily != '' )" if params[:filters].include?('daily')
          conditions << "(intern IS NOT NULL AND intern != '' )" if params[:filters].include?('intern')
          conditions << "(user_id IS NOT NULL AND user_id != '' )" if params[:filters].include?('user_id')
         
         #複数の検索をORで結合して検索して表示するかつ何もhitしなかったら表示しないようにするためのコード
         @firsty=@firsty.where(conditions.join(" OR ")) if conditions.any?
         #ORの部分はスペースを開けること、開けないと複数の検索が実装できないため 
        end

         #検索結果が存在しない場合のフラグを設定
         @no_results_1 = @search_executed_1 && @firsty.empty?
     end

     #大学2年生を紹介するサイト
     def secondy
         @secondy=Universitylife.where(selsect:"secondy")
        #検索機能
         @search_executed_2 = params[:filters].present?
          if @search_executed_2
           conditions = []
           conditions << "(study IS NOT NULL AND study != '' )" if params[:filters].include?('study')
           conditions << "(parttimejob IS NOT NULL AND parttimejob != '' )" if params[:filters].include?('parttimejob')
           conditions << "(circle IS NOT NULL AND circle != '' )" if params[:filters].include?('circle')
           conditions << "(daily IS NOT NULL AND daily != '' )" if params[:filters].include?('daily')
           conditions << "(intern IS NOT NULL AND intern != '' )" if params[:filters].include?('intern')
           conditions << "(user_id IS NOT NULL AND user_id != '' )" if params[:filters].include?('user_id')
         
           @secondy=@secondy.where(conditions.join(" OR ")) if conditions.any?
         
          end
           @no_results_2 = @search_executed_2 && @secondy.empty?

     end

     #大学3年生を紹介するサイト
     def thirdy
         @thirdy=Universitylife.where(selsect:"thirdy")
        #検索機能
         @search_executed_3 = params[:filters].present?
          if @search_executed_3
            conditions = []
            conditions << "(study IS NOT NULL AND study != '' )" if params[:filters].include?('study')
            conditions << "(parttimejob IS NOT NULL AND parttimejob != '' )" if params[:filters].include?('parttimejob')
            conditions << "(circle IS NOT NULL AND circle != '' )" if params[:filters].include?('circle')
            conditions << "(daily IS NOT NULL AND daily != '' )" if params[:filters].include?('daily')
            conditions << "(intern IS NOT NULL AND intern != '' )" if params[:filters].include?('intern')
            conditions << "(user_id IS NOT NULL AND user_id != '' )" if params[:filters].include?('user_id')
         
            @thirdy=@thirdy.where(conditions.join(" OR ")) if conditions.any?
          end
            @no_results_3 = @search_executed_3 && @thirdy.empty?


     end

     #大学4年生を紹介するサイト
     def fourthy
         @fourthy=Universitylife.where(selsect:"fourthy")
        #検索機能
         @search_executed_4 = params[:filters].present?
          if @search_executed_4
            conditions = []
            conditions << "(study IS NOT NULL AND study != '' )" if params[:filters].include?('study')
            conditions << "(parttimejob IS NOT NULL AND parttimejob != '' )" if params[:filters].include?('parttimejob')
            conditions << "(circle IS NOT NULL AND circle != '' )" if params[:filters].include?('circle')
            conditions << "(daily IS NOT NULL AND daily != '' )" if params[:filters].include?('daily')
            conditions << "(intern IS NOT NULL AND intern != '' )" if params[:filters].include?('intern')
            conditions << "(user_id IS NOT NULL AND user_id != '' )" if params[:filters].include?('user_id')
         
            @fourthy=@fourthy.where(conditions.join(" OR ")) if conditions.any?
          end
            @no_results_4 = @search_executed_4 && @fourthy.empty?


     end

     





     private

     def universitylife_params
        params.require(:universitylife).permit(:selsect, :study, :parttimejob, :circle, :daily, :intern, :user_id)
     end

end
