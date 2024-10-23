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


     end

     #大学2年生を紹介するサイト
     def secondy
         @secondy=Universitylife.where(selsect:"secondy")
        #検索機能


     end

     #大学3年生を紹介するサイト
     def thirdy
         @thirdy=Universitylife.where(selsect:"thirdy")
        #検索機能


     end

     #大学4年生を紹介するサイト
     def fourthy
         @fourthy=Universitylife.where(selsect:"fourthy")
        #検索機能


     end

     





     private

     def universitylife_params
        params.require(:universitylife).permit(:selsect, :study, :parttimejob, :circle, :daily, :intern)
     end

end
