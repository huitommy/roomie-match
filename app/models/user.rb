class User < ActiveRecord::Base
  has_many :preferences

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  validates :dob, presence: true
  validates :email, presence: true

  def full_name
    @full_name = "#{first_name} #{last_name}"
  end
end
