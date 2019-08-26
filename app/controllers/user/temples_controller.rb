class User::TemplesController < ApplicationController
  PER = 15

  def index
    from = Time.now.at_beginning_of_day
    to = (from + 6.day).at_end_of_day
    @all_ranks = Temple.find(Clip.where(created_at: from...to).group(:temple_id).order('count(temple_id) desc').limit(10).pluck(:temple_id))
    @hokkaidous = Temple.where("area = 1").page(params[:page]).per(PER)
    @touhokus = Temple.where("area = 2").page(params[:page]).per(PER)
    @kantous = Temple.where("area = 3").page(params[:page]).per(PER)
    @tyubus = Temple.where("area = 4").page(params[:page]).per(PER)
    @kinkis = Temple.where("area = 5").page(params[:page]).per(PER)
    @tyugokus = Temple.where("area = 6").page(params[:page]).per(PER)
    @sikokus = Temple.where("area = 7").page(params[:page]).per(PER)
    @kyusyus = Temple.where("area = 8").page(params[:page]).per(PER)
  end

  def show
  	@temple = Temple.find(params[:id])
  	@user = current_user
    @memorys = @temple.memorys.page(params[:page]).per(10).order(created_at: "DESC")
  end

  def edit
    @temple = Temple.find(params[:id])
  end

  def search
    @q = Temple.search(search_params)
    @temples = @q.result(distinct: true).page(params[:page]).per(15).order(created_at: "DESC")
  end

  def searchform
    @q = Temple.ransack(params[:q])
    @temples = @q.result(distinct: true)
    @goriyakus = Goriyaku.all
    @prefectures = Prefecture.all
  end


  def complete
  end


   private
  def search_params
    params.require(:q).permit!
  end
end
