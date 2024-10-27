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
        @universitylife = Universitylife.new(universitylife_params)
        if @universitylife.save
          redirect_to intrograde_universitylives_path, notice: 'UniversityLifeを投稿しました'
        else
          render :new
        end
     end

     #削除機能
     def destroy
        @universitylife = Universitylife.find(params[:id])
        @universitylife.destroy
        redirect_to action: :intrograde
     end


     #大学1年生を紹介するサイト
     def firsty

        #投稿するサイトを選択し、投稿内容を示すためのコード
         @firsty=Universitylife.where(selsect:"firsty")
          

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
         
           @secondy=@secondy.where(conditions.join(" OR ")) if conditions.any?
         
          end
           @no_results_2 = @search_executed_2 && @secondy.empty?

     end

     #大学3年生を紹介するサイト
     def thirdy
         @thirdy=Universitylife.where(selsect:"thirdy")
        #検索機能
         @search_executed_3 = params[:filters].present?
          if search_executed_3
            conditions = []
            conditions << "(study IS NOT NULL AND study != '' )" if params[:filters].include?('study')
            conditions << "(parttimejob IS NOT NULL AND parttimejob != '' )" if params[:filters].include?('parttimejob')
            conditions << "(circle IS NOT NULL AND circle != '' )" if params[:filters].include?('circle')
            conditions << "(daily IS NOT NULL AND daily != '' )" if params[:filters].include?('daily')
            conditions << "(intern IS NOT NULL AND intern != '' )" if params[:filters].include?('intern')
         
            @thirdy=@thirdy.where(conditions.join(" OR ")) if conditions.any?
          end
            @no_results_3 = @search_executed_3 && @thirdy.empty?


     end

     #大学4年生を紹介するサイト
     def fourthy
         @fourthy=Universitylife.where(selsect:"fourthy")
        #検索機能
         @search_executed_4 = params[:filters].present?
          if search_executed_4
            conditions = []
            conditions << "(study IS NOT NULL AND study != '' )" if params[:filters].include?('study')
            conditions << "(parttimejob IS NOT NULL AND parttimejob != '' )" if params[:filters].include?('parttimejob')
            conditions << "(circle IS NOT NULL AND circle != '' )" if params[:filters].include?('circle')
            conditions << "(daily IS NOT NULL AND daily != '' )" if params[:filters].include?('daily')
            conditions << "(intern IS NOT NULL AND intern != '' )" if params[:filters].include?('intern')
         
            @fourth=@fourth.where(conditions.join(" OR ")) if conditions.any?
          end
            @no_results_4 = @search_executed_4 && @fourth.empty?


     end

     





     private

     def universitylife_params
        params.require(:universitylife).permit(:selsect, :study, :parttimejob, :circle, :daily, :intern)
     end

end
