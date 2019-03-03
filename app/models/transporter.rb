class Transporter < ApplicationRecord
  belongs_to :company  
  has_many :orders  #removed for testing with Transporter 
#belongs_to :orders


  enum status:{
    "inactive" => 0,
    "active" => 1
  }
end
