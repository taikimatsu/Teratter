class Prefecture < ApplicationRecord
	has_many :temples, dependent: :destroy
	has_many :users, dependent: :destroy

end
