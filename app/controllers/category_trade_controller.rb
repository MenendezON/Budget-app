class CategoryTrade < ApplicationRecord
  belongs_to :category
  belongs_to :trade
end