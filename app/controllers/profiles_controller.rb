class ProfilesController < ApplicationController
      
    def index
      @profiles = Profile.all
    end
    
    def new
      @profile = Profile.new
    end


    def edit
       @profile = Profile.find(params[:id])
    end

    def create
       @profile = Profile.new(profile_params)
       if @profile.save
         redirect_to :action => "index"
       else
         redirect_to :action => "new"
       end
    end
 
    def update
       profile = Profile.find(params[:id])
       if profile.update(profile_params)
         redirect_to :action => "index" , :id => profile.id
       else 
         redirect_to :action => "edit"
       end
    end

    private
    def profile_params
        params.require(:profile).permit(:nickname, :age, :birthday, :hometown, :college, :character)
    end

end
