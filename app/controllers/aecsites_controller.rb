class AecsitesController < ApplicationController

    def index
    end
    def profile
    end
    def universitylife
    end
    def tchcourcelist
        @tchcourcelists=Tchcourcelist.all
    end
    def commoncource
        @commoncources=Commoncource.all
    end
    def tlcource
        @tlcources=Tlcource.all
    end
    
    def commoncourcenew
        @commoncource=Commoncource.new
    end

    def tchcourcelistnew
        @tchcourcelist=Tchcourcelist.new
    end

    def tlcourcenew
        @tlcource=Tlcource.new
    end

    def create
        @commoncource=Commoncource.new(commoncource_params)
        @tchcourcelist=Tchcourcelist.new(tchcourcelist_params)
        @tlcource=Tlcource.new(tlcource_params)

        if @commoncource.save
            redirect_to commoncource_path, notice:'投稿しました'
        else
            render :commoncource
        end

        if @tchcourcelist.save
            redirect_to tchcourcelist_path, notice:'投稿しました'
        else
            render :tchcourcelist
        end

        if @tlcource.save
            redirect_to tlcource_path, notice:'投稿しました'
        else
            render :tlcource
        end
    end

    

    private
    def commoncource_params
        params.require(:commoncource).permit(:lecture, :professor, :grade, :reportage)
    end
    def tchcourcelist_params
        params.require(:commoncource).permit(:lecture, :professor, :grade, :reportage)
    end
    def tlcource_params
        params.require(:commoncource).permit(:lecture, :professor, :grade, :reportage)
    end




end
