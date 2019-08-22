class Temple < ApplicationRecord

	has_many :memorys, dependent: :destroy
	belongs_to :prefecture
	belongs_to :goriyaku
	attachment :mainimage
	has_many :clips, dependent: :destroy
        def cliped_by?(user)
          clips.where(user_id: user.id).exists?
        end
    has_many :temple_images, dependent: :destroy
 	 accepts_attachments_for :temple_images, attachment: :image

	validates :prefecture_id, presence: true
	validates :goriyaku_id, presence: true

	after_validation :geocode

	  private
	  def geocode
	    uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+self.address.gsub(" ", "")+"&key=AIzaSyDV7aHnCQ6Lbws5KlkFCA7XzgB4So2mREE")
	    res = HTTP.get(uri).to_s
	    response = JSON.parse(res)
	    self.latitude = response["results"][0]["geometry"]["location"]["lat"]
	    self.longitude = response["results"][0]["geometry"]["location"]["lng"]
	  end


  	enum area: { 北海道: 1, 東北: 2, 関東: 3, 中部: 4, 近畿: 5,中国: 6, 四国: 7, 九州沖縄:8 }
end
