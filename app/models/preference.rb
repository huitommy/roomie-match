class Preference < ActiveRecord::Base
  belongs_to :user
  belongs_to :dwelling

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :date_of_birth, presence: true
  validates :gender, presence: true
  validates :pets, presence: true
  validates :smoking, presence: true, numericality: true, inclusion: { in: -1..1 }
  validates :drinking, presence: true, numericality: true, inclusion: { in: -1..1 }
  validates :music, presence: true, numericality: true, inclusion: { in: -1..1 }
  validates :vegetarian, presence: true, numericality: true, inclusion: { in: -1..1 }
  validates :cleanliness, presence: true, numericality: true, inclusion: { in: -1..1 }
  validates :parties, presence: true, numericality: true, inclusion: { in: -1..1 }
  validates :sports, presence: true, numericality: true, inclusion: { in: -1..1 }
  validates :user, presence: true

  DROPDOWN = [
    ["Yes", 1],
    ["No Preference", 0],
    ["No", -1],
  ]

  GENDER = [
    ["Male", "male"],
    ["Female", "female"],
    ["Unsure", "unsure"],
  ]

  def full_name
    @full_name = "#{first_name} #{last_name}"
  end
end
