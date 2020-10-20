class Category < ApplicationRecord
  belongs_to :user
  has_many :contents
  has_many :users, through: :contents

  validates :name, presence: true, uniqueness: true
end
