class Dwelling < ActiveRecord::Base
  has_many :preferences

  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :category, presence: true
  validates :bedrooms, presence: true, numericality: true
  validates :bathrooms, presence: true, numericality: true
  validates :sq_ft, presence: true, numericality: true
  validates :rent, presence: true, numericality: true
  validates :parking, presence: true, default: false
end
