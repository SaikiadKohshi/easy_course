class TlcourcesController < ApplicationController

      
      def tlcource
        @tlcource = Tlcource.find(params[:id])
        render :tlcource
      end
      
      
      def new
        @tlcource = Tlcource.new
      end
      

      def create
        @tlcource = Tlcource.new(tlcource_params)
        if @tlcource.save
          redirect_to tlcources_path, notice: 'Tlcourceを投稿しました'
        else
          render :tlcourcenew
        end
      end
    
      


      def destroy
        @tlcource = Tlcource.find(params[:id])
        @tlcource.destroy
        redirect_to aecsites_tlcources_path, notice: '削除しました。'
      end
    
      private
    
      def tlcource_params
        params.require(:tlcource).permit(:lecture, :professor, :grade, :reportage)
      end
    



end
