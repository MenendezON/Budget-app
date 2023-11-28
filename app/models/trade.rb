class Trade < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_trades, dependent: :destroy
  has_many :categories, through: :category_trades

  validates :name, presence: true
  validates :amount, presence: true
end
