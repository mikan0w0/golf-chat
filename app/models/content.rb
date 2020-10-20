class Content < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments
  has_many :user, through: :comments

  validates :content, presence: true
end
