class TempleImage < ApplicationRecord

	belongs_to :temple
  	attachment :image

end
