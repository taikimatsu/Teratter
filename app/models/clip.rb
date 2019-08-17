class Clip < ApplicationRecord

belongs_to :user
belongs_to :temple

from  = Time.now.at_beginning_of_day
to    = (from + 6.day).at_end_of_day

end
