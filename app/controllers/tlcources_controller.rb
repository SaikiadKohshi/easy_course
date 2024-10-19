class TlcourcesController < ApplicationController

      #画面表示機能
      def index
        #@tlcource = Tlcource.find(params[:id])
        @tlcources = Tlcource.all
        #render :tlcource
      end
      
      #新規投稿機能
      def new
        @tlcource = Tlcource.new
      end
      
      #新規投稿機能の中身
      def create
        @tlcource = Tlcource.new(tlcource_params)
        if @tlcource.save
          redirect_to tlcources_path, notice: 'Tlcourceを投稿しました'
        else
          render :new
        end
      end
    
      

      #削除機能
      def destroy
        @tlcource = Tlcource.find(params[:id])
        @tlcource.destroy
        redirect_to tlcources_path, notice: '削除しました。'
      end
    
      private
    
      def tlcource_params
        params.require(:tlcource).permit(:lecture, :professor, :grade, :reportage)
      end
    
end
