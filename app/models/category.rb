class Category < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :trades

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }, uniqueness: true
  validates :icon, presence: true
end
