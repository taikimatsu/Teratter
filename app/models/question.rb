class Question < ApplicationRecord
has_many :answers, dependent: :destroy
belongs_to :user
is_impressionable counter_cache: true

def self.search(search)
		if search
			where(['body LIKE ?', "%#{search}%"])
		else
			all
		end
	end


end
