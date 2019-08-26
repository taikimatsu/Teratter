class Admin::MemorysController < ApplicationController
  PER = 10
  def index
    from = Time.now.at_beginning_of_day
    to = (from + 6.day).at_end_of_day
    @all_ranks = Memory.find(Favorite.where(created_at: from...to).group(:memory_id).order('count(memory_id) desc').limit(10).pluck(:memory_id))
    @memorys = Memory.page(params[:page]).per(PER).order(created_at: "DESC")
  end

  def destroy
      @memory = Memory.find(params[:id])
      @memory.destroy
      redirect_to user_user_path(current_user.id)
  end

  def edit
  end
end
