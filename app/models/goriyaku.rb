class Goriyaku < ApplicationRecord

has_many :temples, dependent: :destroy


end
