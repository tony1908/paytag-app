class Cuser < ActiveRecord::Base
	belongs_to :user
	has_many :bankAccounts
	has_many :products
	has_many :records
end
