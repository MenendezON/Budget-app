require 'rails_helper'

RSpec.describe 'Categories', type: :system, js: true do
  describe 'index page' do
    before :each do
      visit '/users/sign_up'
      within('#new_user') do
        fill_in 'user[name]', with: 'Marthekod'
        fill_in 'user[email]', with: 'marthekod@gmail.com'
        fill_in 'user[password]', with: 'ilovemywife'
        fill_in 'user[password_confirmation]', with: 'ilovemywife'
      end
      click_button 'Sign up'

      click_link('Add new category')
      fill_in 'category[name]', with: 'Cheese'
      fill_in 'category[icon]', with: 'https://cdn-icons-png.flaticon.com/512/4063/4063291.png'
      find('input[name="commit"]').click
    end

    it 'renders category name' do
      expect(page).to have_content('Cheese')
    end

    it 'renders category icon' do
      expect(page).to have_css("img[alt='Icon pic'][src='https://cdn-icons-png.flaticon.com/512/4063/4063291.png']")
    end

    it 'renders category\'s total expenses' do
      expect(page).to have_content('Free')
    end

    it 'redirects to specific category page' do
      click_link 'Cheese'
      expect(page).to have_content('Add new trade')
    end

    it 'redirects to form to create new category' do
      click_link 'Add new category'
      expect(page).to have_current_path(new_category_path)
    end
  end
end
