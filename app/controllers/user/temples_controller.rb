class User::TemplesController < ApplicationController



  def index
    from = Time.now.at_beginning_of_day
    to = (from + 1.day).at_end_of_day
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

  def edit
    @temple = Temple.find(params[:id])
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


  def complete
  end


   private
  def search_params
    params.require(:q).permit!
  end
end
