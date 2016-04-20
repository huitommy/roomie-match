class Preference < ActiveRecord::Base

  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :gender, presence: true
  validates :smoking, presence: true, numericality: true, inclusion: { in: -1..1 }
  validates :drinking, presence: true, numericality: true, inclusion: { in: -1..1 }
  validates :music, presence: true, numericality: true, inclusion: { in: -1..1 }
  validates :vegetarian, presence: true, numericality: true, inclusion: { in: -1..1 }
  validates :cleanliness, presence: true, numericality: true, inclusion: { in: -1..1 }
  validates :parties, presence: true, numericality: true, inclusion: { in: -1..1 }
  validates :sports, presence: true, numericality: true, inclusion: { in: -1..1 }
  validates :user, presence: true, uniqueness: true

  DROPDOWN = [
    ["Yes", 1],
    ["No Preference", 0],
    ["No", -1],
  ].freeze

  GENDER = [
    ["Male", "Male"],
    ["Female", "Female"],
    ["Unsure", "Unsure"],
  ].freeze

  TRUEFALSE = [
    ["True", true],
    ["False", false],
  ].freeze

  def full_name
    @full_name = "#{first_name} #{last_name}"
  end
end
