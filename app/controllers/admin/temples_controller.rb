class Admin::TemplesController < ApplicationController
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

  def edit
  end

  private

  def temple_params
    params.require(:temple).permit(:name, :area, :address, :mainimage, :prefecture_id, :goriyaku_id, :latitude, :longitude, temple_images_images: [])
  end
end
