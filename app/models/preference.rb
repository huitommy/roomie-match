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
  validates :user, presence: true, uniqueness: true

  DROPDOWN = [
    ["Yes", 1],
    ["No Preference", 0],
    ["No", -1],
  ].freeze

  GENDER = [
    ["Male", "male"],
    ["Female", "female"],
    ["Unsure", "unsure"],
  ].freeze

  def full_name
    @full_name = "#{first_name} #{last_name}"
  end
  
  def match_rating(preferences2)
    match = 0
    if self.smoking == preferences2.smoking
      match += 2
    elsif self.smoking == 0 || preferences2.smoking == 0
      match += 1
    else
      match -= 2
    end
    if self.drinking == preferences2.drinking
      match += 2
    elsif self.drinking == 0 || preferences2.drinking == 0
      match += 1
    else
      match -= 2
    end
    if self.music == preferences2.music
      match += 2
    elsif self.music == 0 || preferences2.music == 0
      match += 1
    else
      match -= 2
    end
    if self.vegetarian == preferences2.vegetarian
      match += 2
    elsif self.vegetarian == 0 || preferences2.vegetarian == 0
      match += 1
    else
      match -= 2
    end
    if self.cleanliness == preferences2.cleanliness
      match += 2
    elsif self.cleanliness == 0 || preferences2.cleanliness == 0
      match += 1
    else
      match -= 2
    end
    if self.parties == preferences2.parties
      match += 2
    elsif self.parties == 0 || preferences2.parties == 0
      match += 1
    else
      match -= 2
    end
    if self.sports == preferences2.sports
      match += 2
    elsif self.sports == 0 || preferences2.sports == 0
      match += 1
    else
      match -= 2
    end
    match
  end
end
