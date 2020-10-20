class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :contents
  has_many :categories
  has_many :categories, through: :contents
  has_many :comments

  validates :name, presence: true, uniqueness: true
  validates :info, presence: true
end
