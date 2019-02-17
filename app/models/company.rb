class Company < ApplicationRecord
  has_many :transporters, dependent: :destroy
  has_many :orders, through: :transporters

  enum status:{
    "inactive" => 0,
    "active" => 1
  }

  geocoded_by :address
  after_validation :geocode,  if: :address_changed?
end
