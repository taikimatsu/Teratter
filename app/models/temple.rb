class Temple < ApplicationRecord

	has_many :memorys, dependent: :destroy
	has_many :browsinghistory, dependent: :destroy
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

	geocoded_by :address
  	after_validation :geocode, if: :address_changed?

  	enum area: { 北海道: 1, 東北: 2, 関東: 3, 中部: 4, 近畿: 5,中国: 6, 四国: 7, 九州沖縄:8 }
end
