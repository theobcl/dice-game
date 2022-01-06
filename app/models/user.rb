class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :rooms
  has_many :games, through: :rooms
  has_one_attached :avatar

  validates :first_name, uniqueness: { scope: :last_name }
  validates :nick_name, uniqueness: true, length: { minimum: 2 }
end
