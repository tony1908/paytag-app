class SoldProduct < ActiveRecord::Base
	belongs_to :record
	belongs_to :product 
end
