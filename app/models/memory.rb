class Memory < ApplicationRecord

	belongs_to :user
	belongs_to :temple
	has_many :favorites, dependent: :destroy
	has_many :memory_images, dependent: :destroy
  	accepts_attachments_for :memory_images, attachment: :image
        def favorited_by?(user)
          favorites.where(user_id: user.id).exists?
        end
end
