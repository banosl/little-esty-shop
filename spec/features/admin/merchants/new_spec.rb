require 'rails_helper'

RSpec.describe '/Admin/Merchant/New' do
  describe 'visiting admin merchant new' do
    describe 'user story 29' do 
      it 'displays a link to create a new merchant' do 
        visit admin_merchants_path 
        expect(page).to have_link('Create a new merchant')
      end

      it 'redirects user to admin merchants new page' do 
        visit admin_merchants_path
        click_link 'Create a new merchant'
        expect(current_path).to eq(new_admin_merchant_path)
      end

      it 'displays a form to create a new merchant' do 
        visit new_admin_merchant_path 
        expect(page).to have_field('Name')
      end

      it 'creates a new merchant upon clicking Submit' do 
        visit new_admin_merchant_path 
        fill_in 'Name', with: 'New Jeff'  
        click_on 'Submit' 
        expect(current_path).to eq(admin_merchants_path) 
        within('#disabled_merchants') do 
          expect(page).to have_content('New Jeff')
        end
      end
    end
  end
end