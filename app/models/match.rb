class Match < ActiveRecord::Base
  belongs_to :user
  belongs_to :dwelling

  validates :user_id, presence: true
  validates :dwelling_id, presence: true
  validates :score, presence: true, numericality: { in: -14..14 }
end
