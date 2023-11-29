require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do
    it 'should have a name' do
      user = User.new(email: 'menendezon@gmail.com', password: 'test123')
      expect(user.valid?).to eq false
    end

    it 'should have a string name' do
      user = User.new(name: 'Menendez', email: 'menendezon@gmail.com', password: '123456')
      expect(user.valid?).to eq true
    end

    it 'should have an email' do
      user = User.new(name: 'Menendez', password: 'test123')
      expect(user.valid?).to eq false
    end

    it 'should have a password' do
      user = User.new(name: 'Menendez', email: 'menendezon@gmail.com')
      expect(user.valid?).to eq false
    end
  end

  context 'Associations' do
    it 'has many categories' do
      user = User.reflect_on_association('categories')
      expect(user.macro).to eq(:has_many)
    end
  end
end