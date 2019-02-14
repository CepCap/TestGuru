class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges

  validates :name, :description, :requirement, :picture_link, presence: true

end
