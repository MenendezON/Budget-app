class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_trades, dependent: :destroy
  has_many :trades, through: :category_trades

  validates :name, presence: true
  validates :icon, presence: true
end