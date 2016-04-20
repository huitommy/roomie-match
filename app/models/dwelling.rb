class Dwelling < ActiveRecord::Base
  belongs_to :user
  has_many :matches

  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :category, presence: true
  validates :bedrooms, presence: true, numericality: true
  validates :bathrooms, presence: true, numericality: true
  validates :sq_ft, presence: true, numericality: true
  validates :rent, presence: true, numericality: true

  STATES = [
    ["Alaska", "AK"], ["Alabama", "AL"], ["Arkansas", "AR"], ["Arizona", "AZ"],
    ["California", "CA"], ["Colorado", "CO"], ["Connecticut", "CT"], ["District of Columbia", "DC"],
    ["Delaware", "DE"], ["Florida", "FL"], ["Georgia", "GA"], ["Hawaii", "HI"], ["Iowa", "IA"],
    ["Idaho", "ID"], ["Illinois", "IL"], ["Indiana", "IN"], ["Kansas", "KS"], ["Kentucky", "KY"],
    ["Louisiana", "LA"], ["Massachusetts", "MA"], ["Maryland", "MD"], ["Maine", "ME"], ["Michigan", "MI"],
    ["Minnesota", "MN"], ["Missouri", "MO"], ["Mississippi", "MS"], ["Montana", "MT"], ["North Carolina", "NC"],
    ["North Dakota", "ND"], ["Nebraska", "NE"], ["New Hampshire", "NH"], ["New Jersey", "NJ"],
    ["New Mexico", "NM"], ["Nevada", "NV"], ["New York", "NY"], ["Ohio", "OH"], ["Oklahoma", "OK"],
    ["Oregon", "OR"], ["Pennsylvania", "PA"], ["Rhode Island", "RI"], ["South Carolina", "SC"], ["South Dakota", "SD"],
    ["Tennessee", "TN"], ["Texas", "TX"], ["Utah", "UT"], ["Virginia", "VA"], ["Vermont", "VT"],
    ["Washington", "WA"], ["Wisconsin", "WI"], ["West Virginia", "WV"], ["Wyoming", "WY"]
  ].freeze

  BEDROOMS = [
    ["0", 0],
    ["1", 1],
    ["2", 2],
    ["3", 3],
    ["4", 4],
    ["5", 5],
    ["6", 6],
  ].freeze

  BATHROOMS = [
    ["1", 1],
    ["1.5", 1.5],
    ["2", 2],
    ["2.5", 2.5],
    ["3", 3],
    ["3.5", 3.5],
    ["4", 4],
    ["4.5", 4.5],
    ["5", 5],
  ].freeze

  CATEGORIES = [
    ["House", "House"],
    ["Apartment", "Apartment"],
    ["Condo", "Condo"],
    ["Co-Op", "Co-Op"],
    ["Townhouse", "Townhouse"],
  ].freeze
end
