class Registration < ActiveRecord::Base

  validates :password, presence: :true
  validates :email, presence: :true
  
end
