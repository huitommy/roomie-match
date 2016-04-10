class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable,
        :validatable, :authentication_keys => [:login]
  has_many :preferences

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  validates :dob, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username,
    presence: true,
    uniqueness: {
      case_sensitive: false
    }
  validate :validate_username

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def full_name
    @full_name = "#{first_name} #{last_name}"
  end

  def login=(login)
    @login = login
  end

  def login
    @login || self.username || self.email
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end
end
