class User::MemorysController < ApplicationController
  PER = 10
  def index
    from = Time.now.at_beginning_of_day
    to = (from + 6.day).at_end_of_day
    @all_ranks = Memory.find(Favorite.where(created_at: from...to).group(:memory_id).order('count(memory_id) desc').limit(10).pluck(:memory_id))
    @memorys = Memory.page(params[:page]).per(PER).order(created_at: "DESC")
  end

  def new
    @temple = Temple.find(params[:id])
  	@memory = Memory.new
    @memory.memory_images.build
  end

  def create
  	@temple = Temple.find(params[:id])
  	@memory = @temple.memorys.build(memory_params)
  	@memory.user_id = current_user.id
  	if
      @memory.save!
      redirect_to user_temple_path(@temple)
    else
      render :new
    end
  end

  def edit
    @memory = Memory.find(params[:id])
  end

  def update
    @memory = Memory.find(params[:id])
    if @memory.update(memory_params)
       flash[:notice] = "memoryを更新しました"
       redirect_to user_user_path(current_user.id)
    else
       render :edit
    end
  end

  def destroy
      @memory = Memory.find(params[:id])
      @memory.destroy
      redirect_to user_user_path(current_user.id)
  end

   private

  def memory_params
    params.require(:memory).permit(:user_id, :temple_id, :title, :body, :visit_date, memory_images_images: [])
  end
end
