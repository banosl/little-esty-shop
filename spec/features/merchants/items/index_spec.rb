require 'rails_helper'

RSpec.describe 'Merchant Items Index page' do
  before :each do 
    @merchant_1 = Merchant.create!(name: 'Schroeder-Jerde')
    @merchant_2 = Merchant.create!(name: 'Rempel and Jones')
    @merchant_3 = Merchant.create!(name: 'Willms and Sons')

    @item_1 = @merchant_1.items.create!(name: 'Qui Esse', description: 'Nihil autem sit odio inventore deleniti', unit_price: 75107, status: 'enabled')
    @item_2 = @merchant_1.items.create!(name: 'Autem Minima', description: 'Cumque consequuntur ad', unit_price: 67076, status: 'disabled')
    @item_3 = @merchant_1.items.create!(name: 'Ea Voluptatum', description: 'Sunt officia eum qui molestiae', unit_price: 32301)
    @item_4 = @merchant_1.items.create!(name: 'Nemo Facere', description: 'Sunt eum id eius magni consequuntur delectus veritatis', unit_price: 4291)
    @item_5 = @merchant_1.items.create!(name: 'Expedita Aliquam', description: 'Voluptate aut labore qui illum tempore eius. Corrupti cum et rerum', unit_price: 68723)
    @item_6 = @merchant_1.items.create!(name: 'Provident At', description: 'Numquam officiis reprehenderit eum ratione neque tenetur', unit_price: 15925)
    @item_7 = @merchant_1.items.create!(name: 'Expedita Fuga', description: 'Fuga assumenda occaecati hic dolorem tenetur dolores nisi', unit_price: 31163)
    @item_8 = @merchant_2.items.create!(name: 'Est Consequuntur', description: 'Reprehenderit est officiis cupiditate quia eos', unit_price: 34355)
    @item_9 = @merchant_2.items.create!(name: 'Quo Magnam', description: 'Culpa deleniti adipisci voluptates aut. Sed eum quisquam nisi', unit_price: 22582)
    @item_10 = @merchant_2.items.create!(name: 'Quidem Suscipit', description: 'Reiciendis sed aperiam culpa animi laudantium', unit_price: 34018)
  
    @customer_1 = Customer.create!(first_name: 'Joey', last_name: 'Ondricka')
    @customer_2 = Customer.create!(first_name: 'Cecelia', last_name: 'Osinski')

    @invoice_1 = @customer_1.invoices.create!(status: 'cancelled')
    @invoice_2 = @customer_1.invoices.create!(status: 'cancelled')
    @invoice_3 = @customer_1.invoices.create!(status: 'completed')
    @invoice_4 = @customer_1.invoices.create!(status: 'in progress')
    @invoice_5 = @customer_1.invoices.create!(status: 'cancelled')
    @invoice_6 = @customer_1.invoices.create!(status: 'in progress')
    @invoice_7 = @customer_1.invoices.create!(status: 'in progress')
    @invoice_8 = @customer_1.invoices.create!(status: 'cancelled')
    @invoice_9 = @customer_1.invoices.create!(status: 'completed')
    @invoice_10 = @customer_1.invoices.create!(status: 'completed')

    @invoice_item_1 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_1.id, quantity: 5, unit_price: 100, status: 'packaged')
    @invoice_item_2 = InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item_1.id, quantity: 10, unit_price: 250, status: 'pending')
    @invoice_item_3 = InvoiceItem.create!(invoice_id: @invoice_3.id, item_id: @item_2.id, quantity: 10, unit_price: 1500, status: 'packaged')
    @invoice_item_4 = InvoiceItem.create!(invoice_id: @invoice_4.id, item_id: @item_2.id, quantity: 5, unit_price: 220, status: 'pending')
    @invoice_item_5 = InvoiceItem.create!(invoice_id: @invoice_5.id, item_id: @item_2.id, quantity: 2, unit_price: 300, status: 'packaged')
    @invoice_item_6 = InvoiceItem.create!(invoice_id: @invoice_6.id, item_id: @item_3.id, quantity: 15, unit_price: 100, status: 'shipped')
    @invoice_item_7 = InvoiceItem.create!(invoice_id: @invoice_7.id, item_id: @item_4.id, quantity: 10, unit_price: 250, status: 'shipped')
    @invoice_item_8 = InvoiceItem.create!(invoice_id: @invoice_8.id, item_id: @item_4.id, quantity: 8, unit_price: 200, status: 'packaged')
    @invoice_item_9 = InvoiceItem.create!(invoice_id: @invoice_9.id, item_id: @item_5.id, quantity: 8, unit_price: 50, status: 'packaged')
    @invoice_item_10 = InvoiceItem.create!(invoice_id: @invoice_10.id, item_id: @item_5.id, quantity: 10, unit_price: 1000, status: 'shipped')
    @invoice_item_11 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_5.id, quantity: 10, unit_price: 10, status: 'shipped')
    @invoice_item_12 = InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item_5.id, quantity: 10, unit_price: 1000, status: 'packaged')
    @invoice_item_13 = InvoiceItem.create!(invoice_id: @invoice_3.id, item_id: @item_6.id, quantity: 5, unit_price: 2500, status: 'packaged')
    @invoice_item_14 = InvoiceItem.create!(invoice_id: @invoice_4.id, item_id: @item_6.id, quantity: 9, unit_price: 500, status: 'packaged')
    @invoice_item_15 = InvoiceItem.create!(invoice_id: @invoice_5.id, item_id: @item_7.id, quantity: 10, unit_price: 800, status: 'packaged')
    @invoice_item_16 = InvoiceItem.create!(invoice_id: @invoice_6.id, item_id: @item_7.id, quantity: 20, unit_price: 900, status: 'packaged')
    @invoice_item_17 = InvoiceItem.create!(invoice_id: @invoice_7.id, item_id: @item_7.id, quantity: 5, unit_price: 100, status: 'packaged')
    @invoice_item_18 = InvoiceItem.create!(invoice_id: @invoice_8.id, item_id: @item_7.id, quantity: 3, unit_price: 1000, status: 'packaged')
    
    @transaction_1 = @invoice_1.transactions.create!(credit_card_number: '4654405418249632', credit_card_expiration_date: '04/22/20', result: 'failed')
    @transaction_2 = @invoice_1.transactions.create!(credit_card_number: '4654405418249632', credit_card_expiration_date: '04/22/20', result: 'success')
    
    @transaction_3 = @invoice_2.transactions.create!(credit_card_number: '4580251236515201', credit_card_expiration_date: '03/22/20', result: 'failed')
    @transaction_4 = @invoice_3.transactions.create!(credit_card_number: '4354495077693036', credit_card_expiration_date: '09/22/20', result: 'success')
    @transaction_5 = @invoice_4.transactions.create!(credit_card_number: '4515551623735607', credit_card_expiration_date: '08/22/20', result: 'success')
    @transaction_6 = @invoice_5.transactions.create!(credit_card_number: '4203696133194408', credit_card_expiration_date: '02/22/20', result: 'success')

    @transaction_7 = @invoice_6.transactions.create!(credit_card_number: '4801647818676136', credit_card_expiration_date: '01/22/20', result: 'sucess')

    @transaction_8 = @invoice_7.transactions.create!(credit_card_number: '4540842003561938', credit_card_expiration_date: '09/22/20', result: 'success')
    
    @transaction_9 = @invoice_8.transactions.create!(credit_card_number: '4140149827486249', credit_card_expiration_date: '10/22/20', result: 'success')

    @transaction_10 = @invoice_9.transactions.create!(credit_card_number: '4140149827486249', credit_card_expiration_date: '08/22/20', result: 'failed')
    @transaction_11 = @invoice_9.transactions.create!(credit_card_number: '4140149827486249', credit_card_expiration_date: '08/22/20', result: 'success')
    
    @transaction_12 = @invoice_10.transactions.create!(credit_card_number: '4017503416578382', credit_card_expiration_date: '08/22/20', result: 'success')
  end
  
#  As a merchant,
# When I visit my merchant items index page ("merchants/merchant_id/items")
# I see a list of the names of all of my items
# And I do not see items for any other merchant
  describe 'User story 6' do
    it 'displays a list of all merchant items for that particular merchant' do
      visit merchant_items_path(@merchant_1.id)
        expect(page).to have_content(@item_1.name)
        expect(page).to have_content(@item_2.name)
        expect(page).to have_content(@item_3.name)
        expect(page).to have_content(@item_4.name)
        expect(page).to have_content(@item_5.name)
        expect(page).to_not have_content(@item_8.name)
        expect(page).to_not have_content(@item_9.name)
        expect(page).to_not have_content(@item_10.name)
    end
  end
  
  # Part 1:
  # As a merchant,
  # When I click on the name of an item from the merchant items index page,
  # Then I am taken to that merchant's item's show page (/merchants/merchant_id/items/item_id)

  # Part 2: And I see all of the item's attributes including:
  
  # - Name
  # - Description
  # - Current Selling Price
  describe 'User story 7 (part 1)' do
    it 'displays the item name as a link which links to the items show page' do
      visit merchant_items_path(@merchant_1.id)

      expect(page).to have_link("#{@item_1.name}", :href => "/merchants/#{@merchant_1.id}/items/#{@item_1.id}")
      expect(page).to have_link("#{@item_2.name}", :href => "/merchants/#{@merchant_1.id}/items/#{@item_2.id}")
      expect(page).to_not have_link("#{@item_8.name}", :href => "/merchants/#{@merchant_2.id}/items/#{@item_8.id}")

      click_link("#{@item_1.name}")
      
      expect(current_path).to eq("/merchants/#{@merchant_1.id}/items/#{@item_1.id}")
    end
  end
  
# As a merchant
# When I visit my items index page ("merchants/merchant_id/items")
# Next to each item name I see a button to disable or enable that item.
# When I click this button
# Then I am redirected back to the items index
# And I see that the items status has changed
  describe 'User story 9' do
    it 'next to each name, I see a button to enable or disable that item' do
      visit merchant_items_path(@merchant_1.id)

      expect(page).to have_button('Enable')
      expect(page).to have_button('Disable')
    end
    
    it 'click the button and be redirected to the items index page, where the items status is changed' do
      visit merchant_items_path(@merchant_1.id)
      
      expect(@item_1.status).to eq('enabled')
      expect(page).to have_button('Disable', id: @item_1.id)
      expect(@item_2.status).to eq('disabled')
      expect(page).to have_button('Enable', id: @item_2.id)
      
      click_button('Disable', id: @item_1.id)
      
      expect(current_path).to eq(merchant_items_path(@merchant_1.id))
      @item_1.reload
      expect(@item_1.status).to eq('disabled')
      expect(@item_2.status).to eq('disabled')
    end
  end

# As a merchant,
# When I visit my merchant items index page
# Then I see two sections, one for "Enabled Items" and one for "Disabled Items"
# And I see that each Item is listed in the appropriate section
  describe 'User story 10' do
    it 'has two sections for enabled and disabled items' do
      visit merchant_items_path(@merchant_1.id)
      # visit "merchants/#{@merchant_1.id}/items"

      within("#enabled_item_#{@item_1.id}") do
        expect(page).to have_button('Disable')
        expect(page).to_not have_button('Enable')
      end
      
      within("#enabled_item_#{@item_3.id}") do
        expect(page).to have_button('Disable')
      end
      
      within("#disabled_item_#{@item_2.id}") do
        expect(page).to have_button('Enable')
        expect(page).to_not have_button('Disable')
      end
      
      expect(page).to have_content('Enabled Items')
      expect(page).to have_content('Disabled Items')
    end 
  end


  # As a merchant
  # When I visit my items index page
  # I see a link to create a new item.
  # When I click on the link,
  # I am taken to a form that allows me to add item information.
  # When I fill out the form I click ‘Submit’
  # Then I am taken back to the items index page
  # And I see the item I just created displayed in the list of items.
  # And I see my item was created with a default status of disabled.
  describe 'user story 11' do 
    it 'displays a link to create a new item' do
      visit merchant_items_path(@merchant_1.id)
 
      click_link('Create a new item')

      expect(current_path).to eq(new_merchant_item_path(@merchant_1.id))

      fill_in 'Name', with: "Soccer Ball"
      fill_in 'Description', with: "black and white"
      fill_in 'Unit price', with: 22555
      click_button 'Submit'

      expect(current_path).to eq(merchant_items_path(@merchant_1.id))
      expect(page).to have_content("Soccer Ball")
      expect(page).to have_content("Status: disabled")
    end

    it 'sad path - cannot create a new item if a field is empty' do
      visit new_merchant_item_path(@merchant_1.id)

      fill_in 'Name', with: ""
      fill_in 'Description', with: ""
      fill_in 'Unit price', with: 
      click_button('Submit')

      expect(page).to have_content('Item was not created, please fill out all of the fields.')
      expect(page).to have_button('Submit')
    end
  end

# As a merchant
# When I visit my items index page
# Then I see the names of the top 5 most popular items ranked by total revenue generated
# And I see that each item name links to my merchant item show page for that item
# And I see the total revenue generated next to each item name

  describe 'User story 12' do
    it 'displays the names of the top 5 most popular items (ranked by total revenue) as a link to merchant item show page' do
      visit merchant_items_path(@merchant_1.id)

      within("#popular_items_#{@merchant_1.id}")
        expect(page).to have_link("#{@item_5.name}")
        expect("#{@item_7.name}").to appear_before("#{@item_5.name}")
        expect("#{@item_5.name}").to appear_before("#{@item_2.name}")
        expect("#{@item_5.name}").to appear_before("#{@item_6.name}")
        expect("#{@item_4.name}").to_not appear_before("#{@item_7.name}")

        # expect(@merchant_1.top_5_items_by_revenue).to eq([@item_7, @item_5, @item_2, @item_6, @item_4])
      end
    end
      
    it 'displays the total revenue generated next to each item name' do
      visit merchant_items_path(@merchant_1.id)

      within("#popular_items_#{@merchant_1.id}") do
        expect(page).to have_content('in sales')
        expect(page).to have_content(@merchant_1.top_5_items_by_revenue[0].revenue)
        expect(page).to have_content(@merchant_1.top_5_items_by_revenue[1].revenue)
        expect(page).to have_content(@merchant_1.top_5_items_by_revenue[2].revenue)
        expect(page).to have_content(@merchant_1.top_5_items_by_revenue[3].revenue)
        expect(page).to have_content(@merchant_1.top_5_items_by_revenue[4].revenue)
      end
    end
end