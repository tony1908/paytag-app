class Card < ActiveRecord::Base
	belongs_to :user
	has_many :records
	has_many :cardTransaction
end
