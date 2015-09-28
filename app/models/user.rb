class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :cards
  has_many :addresses
  has_many :records
  has_one :cuser
  has_many :phones

  def checkStatus
  	if self.status == false
  		return true
  	else
  		return false
  	end
  end
  
end
