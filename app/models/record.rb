class Record < ActiveRecord::Base
	belongs_to :user
	belongs_to :cuser
	belongs_to :card
end
