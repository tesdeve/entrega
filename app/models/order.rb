class Order < ApplicationRecord
 #belongs_to :sender
 ##belongs_to :transporter, {:optional => true}   #removed for testing with Transporter it didn't make sense
 #has_many :transporters                          #Added M-2-M through transporters
 #has_many :companies, through: :transporters

 #has_many :order_statuses, dependent: :destroy


  belongs_to :sender
  belongs_to :transporter, {:optional => true}
  has_many :order_statuses, dependent: :destroy

  enum status:{
    "draft" => 0,
    "posted" => 1,
    "taken" => 2,
    "inTransit" => 3,
    "completed" => 4,
    "cancelled" => 5
  }
  
end
