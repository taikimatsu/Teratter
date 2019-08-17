class User::ClipsController < ApplicationController
def create
  	temple = Temple.find(params[:temple_id])
    clip = current_user.clips.new(temple_id: temple.id)
    clip.save
    redirect_back(fallback_location: user_temples_path)
  end

  def destroy
  	temple = Temple.find(params[:temple_id])
    clip = current_user.clips.find_by(temple_id: temple.id)
    clip.destroy
    redirect_back(fallback_location: user_temples_path)
  end


end
