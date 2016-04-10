class Preferences < ActiveRecord::Base
  belongs_to :user
  belongs_to :dwelling

  validates :pets, presence: true
  validates :smoking, presence: true, numericality: true, inclusion: { in: -1..1 }
  validates :drinking, presence: true, numericality: true, inclusion: { in: -1..1 }
  validates :music, presence: true, numericality: true, inclusion: { in: -1..1 }
  validates :vegetarian, presence: true, numericality: true, inclusion: { in: -1..1 }
  validates :cleanliness, presence: true, numericality: true, inclusion: { in: -1..1 }
  validates :parties, presence: true, numericality: true, inclusion: { in: -1..1 }
  validates :sports, presence: true, numericality: true, inclusion: { in: -1..1 }
  validates :user, presence: true
  validates :gender, presence: true
  validates :dob, presence: true

  def full_name
    @full_name = "#{first_name} #{last_name}"
  end
end
