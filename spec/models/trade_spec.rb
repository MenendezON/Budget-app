require 'rails_helper'

RSpec.describe Trade, type: :model do
  before(:example) do
    @user = User.create(name: 'Menendez', email: 'menendezon@gmail.com', password: 'test123')
    @category = Category.new(author: @user, name: 'Sport', icon: 'https://cdn-icons-png.flaticon.com/512/3311/3311579.png')
  end

  context 'Validations' do
    it 'should have a name' do
      trade = Trade.new(author: @user, amount: 200, category_ids: [@category.id])
      expect(trade.valid?).to eq false
    end

    it 'should have an amount' do
      trade = Trade.new(author: @user, name: 'Buy sneakers', category_ids: [@category.id])
      expect(trade.valid?).to eq false
    end

    it 'should have both a name and an amount' do
      trade = Trade.new(author: @user, name: 'Buy sneakers', amount: 745, category_ids: [@category.id])
      expect(trade.valid?).to eq true
    end
  end

  context 'Associations' do
    it 'belongs to an author' do
      trade = Trade.reflect_on_association('author')
      expect(trade.macro).to eq(:belongs_to)
    end

    it 'has many categories' do
      trade = Trade.reflect_on_association('categories')
      expect(trade.macro).to eq(:has_many)
    end
  end
end