class Sender < ApplicationRecord
  has_many :orders, dependent: :destroy

  enum status:{
    "inactive" => 0,
    "active" => 1
  }
end
