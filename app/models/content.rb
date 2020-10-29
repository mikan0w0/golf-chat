class Content < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments

  validates :content, presence: true
end
