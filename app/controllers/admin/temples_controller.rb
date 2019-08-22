class Admin::TemplesController < ApplicationController
    before_action :authenticate_admin!
  def new
  	@temple = Temple.new
    @temple.temple_images.build
  end

  def create
  	@temple = Temple.new(temple_params)
  	if
      @temple.save!
      redirect_to user_temples_path
    else
      render :new
    end
  end

  def index
    from = Time.now.at_beginning_of_day
    to = (from + 6.day).at_end_of_day
    @all_ranks = Temple.find(Clip.where(created_at: from...to).group(:temple_id).order('count(temple_id) desc').limit(10).pluck(:temple_id))
    @hokkaidous = Temple.where("area = 1")
    @touhokus = Temple.where("area = 2")
    @kantous = Temple.where("area = 3")
    @tyubus = Temple.where("area = 4")
    @kinkis = Temple.where("area = 5")
    @tyugokus = Temple.where("area = 6")
    @sikokus = Temple.where("area = 7")
    @kyusyus = Temple.where("area = 8")
  end

  def show
    @temple = Temple.find(params[:id])
    @user = current_user
    @memorys = @temple.memorys
  end

  def create
    @temple = Temple.new(temple_params)
    if
      @temple.save!
      redirect_to admin_temples_path
    else
      render :new
    end
  end

  def edit
    @temple = Temple.find(params[:id])
    @temple.temple_images.build
  end

  def update
    @temple = Temple.find(params[:id])
    if @temple.update(temple_params)
       flash[:notice] = "更新しました"
       redirect_to admin_temple_path(@temple)
    else
       render :edit
    end
  end

  def destroy
      @temple = Temple.find(params[:id])
      @temple.destroy
      redirect_to admin_temples_path
  end

  def search
    @q = Temple.search(search_params)
    @temples = @q.result(distinct: true)
  end

  def searchform
    @q = Temple.ransack(params[:q])
    @temples = @q.result(distinct: true)
    @goriyakus = Goriyaku.all
    @prefectures = Prefecture.all
  end

  private

  def temple_params
    params.require(:temple).permit(:name, :area, :address, :mainimage, :prefecture_id, :goriyaku_id, :latitude, :longitude, temple_images_images: [])
  end

  def search_params
    params.require(:q).permit!
  end
end
