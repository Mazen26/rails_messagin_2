class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, length: { maximum: 10, too_long: "%{count} Characters is the maximum allowed" }
  validates :name, presence: true
  validates_uniqueness_of :name

end
