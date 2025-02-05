class TchcourcelistsController < ApplicationController
  
    def index
        @tchcourcelists = Tchcourcelist.all
    end

    def new
        @tchcourcelist = Tchcourcelist.new
    end

    def create
        @tchcourcelist = Tchcourcelist.new(tchcourcelist_params)
        @tchcourcelist.user_id = current_user.id  # ログインユーザーのIDを設定
        if @tchcourcelist.save
            redirect_to tchcourcelists_path, notice: 'Tchcourcelistを投稿しました'
        else 
           render :new
        end
    end

    def destroy
        @tchcourcelist = Tchcourcelist.find(params[:id])
        @tchcourcelist.destroy
        redirect_to tchcourcelists_path, notice: '削除しました'
    end


    private
    
    def tchcourcelist_params
       params.require(:tchcourcelist).permit(:lecture, :professor, :grade, :reportage, :user_id)
    end



end
