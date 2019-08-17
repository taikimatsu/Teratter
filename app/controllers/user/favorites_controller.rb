class User::FavoritesController < ApplicationController

  def create
  	memory = Memory.find(params[:memory_id])
    favorite = current_user.favorites.new(memory_id: memory.id)
    favorite.save
    redirect_back(fallback_location: user_temples_path)
  end

  def destroy
  	memory = Memory.find(params[:memory_id])
    favorite = current_user.favorites.find_by(memory_id: memory.id)
    favorite.destroy
    redirect_back(fallback_location: user_temples_path)
  end

end
