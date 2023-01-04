require 'rails_helper'

RSpec.describe 'Merchant Dashboard' do
  before :each do
    @merchant_1 = Merchant.create!(name: 'Schroeder-Jerde')
    @merchant_2 = Merchant.create!(name: 'Rempel and Jones')
    @merchant_3 = Merchant.create!(name: 'Willms and Sons')

    @item_1 = @merchant_1.items.create!(name: 'Qui Esse', description: 'Nihil autem sit odio inventore deleniti', unit_price: 75107)
    @item_2 = @merchant_1.items.create!(name: 'Autem Minima', description: 'Cumque consequuntur ad', unit_price: 67076)
    @item_3 = @merchant_1.items.create!(name: 'Ea Voluptatum', description: 'Sunt officia eum qui molestiae', unit_price: 32301)
    @item_4 = @merchant_1.items.create!(name: 'Nemo Facere', description: 'Sunt eum id eius magni consequuntur delectus veritatis', unit_price: 4291)
    @item_5 = @merchant_1.items.create!(name: 'Expedita Aliquam', description: 'Voluptate aut labore qui illum tempore eius. Corrupti cum et rerum', unit_price: 68723)
    @item_6 = @merchant_1.items.create!(name: 'Provident At', description: 'Numquam officiis reprehenderit eum ratione neque tenetur', unit_price: 15925)
    @item_7 = @merchant_1.items.create!(name: 'Expedita Fuga', description: 'Fuga assumenda occaecati hic dolorem tenetur dolores nisi', unit_price: 31163)
    @item_8 = @merchant_1.items.create!(name: 'Est Consequuntur', description: 'Reprehenderit est officiis cupiditate quia eos', unit_price: 34355)
    @item_9 = @merchant_1.items.create!(name: 'Quo Magnam', description: 'Culpa deleniti adipisci voluptates aut. Sed eum quisquam nisi', unit_price: 22582)
    @item_10 = @merchant_1.items.create!(name: 'Quidem Suscipit', description: 'Reiciendis sed aperiam culpa animi laudantium', unit_price: 34018)

    @customer_1 = Customer.create!(first_name: 'Joey', last_name: 'Ondricka')
    @customer_2 = Customer.create!(first_name: 'Cecelia', last_name: 'Osinski')
    @customer_3 = Customer.create!(first_name: 'Mariah', last_name: 'Toy')
    @customer_4 = Customer.create!(first_name: 'Leanna', last_name: 'Braun')
    @customer_5 = Customer.create!(first_name: 'Sylvester', last_name: 'Nader')
    @customer_6 = Customer.create!(first_name: 'Heber', last_name: 'Kuhn')
    @customer_7 = Customer.create!(first_name: 'Parker', last_name: 'Daugherty')
    @customer_8 = Customer.create!(first_name: 'Loyal', last_name: 'Considine')
    @customer_9 = Customer.create!(first_name: 'Dejon', last_name: 'Fadel')
    @customer_10 = Customer.create!(first_name: 'Ramona', last_name: 'Reynolds')

    @invoice_1 = @customer_1.invoices.create!(status: 'cancelled')
    @invoice_2 = @customer_1.invoices.create!(status: 'cancelled')
    @invoice_3 = @customer_2.invoices.create!(status: 'completed')
    @invoice_4 = @customer_2.invoices.create!(status: 'in progress')
    @invoice_5 = @customer_2.invoices.create!(status: 'cancelled')
    @invoice_6 = @customer_3.invoices.create!(status: 'in progress')
    @invoice_7 = @customer_3.invoices.create!(status: 'in progress')
    @invoice_8 = @customer_3.invoices.create!(status: 'cancelled')
    @invoice_9 = @customer_3.invoices.create!(status: 'completed')
    @invoice_10 = @customer_3.invoices.create!(status: 'completed')
    @invoice_13 = @customer_3.invoices.create!(status: 'in progress')
    @invoice_12 = @customer_4.invoices.create!(status: 'completed')

    #do i have to calculate the actual unit_price?
    InvoiceItem.create!(invoice_id: @invoice_1.id  item_id: @item_1.id, quantity: 5, unit_price: 13635, status: 'packaged')
    InvoiceItem.create!(invoice_id: @invoice_1.id  item_id: @item_2.id, quantity: 9, unit_price: 23324, status: 'pending')
    InvoiceItem.create!(invoice_id: @invoice_2.id  item_id: @item_2.id, quantity: 12, unit_price: 34873, status: 'packaged')
    InvoiceItem.create!(invoice_id: @invoice_2.id  item_id: @item_4.id, quantity: 8, unit_price: 2196, status: 'pending')
    InvoiceItem.create!(invoice_id: @invoice_2.id  item_id: @item_5.id, quantity: 3, unit_price: 79140, status: 'packaged')
    InvoiceItem.create!(invoice_id: @invoice_2.id  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
    InvoiceItem.create!(invoice_id: @invoice_3.id  item_id: @item_7.id, quantity: 10, unit_price: 66747, status: 'shipped')
    InvoiceItem.create!(invoice_id: @invoice_3.id  item_id: @item_8.id, quantity: 9, unit_price: 76941, status: 'packaged')

    @transcation_1 = @invoice_1.transactions.create!(credit_card_number: '4654405418249632', credit_card_expiration_date: '04/22/20', result: 'success')
    @transcation_2 = @invoice_2.transactions.create!(credit_card_number: '4580251236515201', credit_card_expiration_date: '03/22/20', result: 'failed')
    @transcation_3 = @invoice_3.transactions.create!(credit_card_number: '4354495077693036', credit_card_expiration_date: '09/22/20', result: 'success')
    @transcation_4 = @invoice_4.transactions.create!(credit_card_number: '4515551623735607', credit_card_expiration_date: '08/22/20', result: 'success')
    @transcation_5 = @invoice_5.transactions.create!(credit_card_number: '4844518708741275', credit_card_expiration_date: '10/22/20', result: 'success')
    @transcation_6 = @invoice_6.transactions.create!(credit_card_number: '4203696133194408', credit_card_expiration_date: '02/22/20', result: 'failed')
    @transcation_7 = @invoice_7.transactions.create!(credit_card_number: '4801647818676136', credit_card_expiration_date: '01/22/20', result: 'failed')
    @transcation_8 = @invoice_8.transactions.create!(credit_card_number: '4540842003561938', credit_card_expiration_date: '09/22/20', result: 'success')
    @transcation_9 = @invoice_9.transactions.create!(credit_card_number: '4140149827486249', credit_card_expiration_date: '10/22/20', result: 'failed')
    @transcation_10 = @invoice10.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'success')

  end
  # As a merchant,
  # When I visit my merchant dashboard (/merchants/merchant_id/dashboard)
  # Then I see the name of my merchant
  describe 'User story 1' do
    it 'can show the merchant name' do
      visit merchant_path(@merchant_1)
      
      expect(page).to have_content(@merchant_1.name)
    end
  end

  describe 'User Story 2' do 
    it 'displays a link to merchant items index and merchant invoices index' do 
      visit merchant_path(@merchant_1)

      expect(page).to have_link("My Items")
      expect(page).to have_link("My Invoices")
      
      click_on "My Items"
      
      expect(current_path).to eq("/merchants/#{@merchant_1.id}/items")      
      
      visit merchant_path(@merchant_1)
      
      click_on "My Invoices"

      expect(current_path).to eq("/merchants/#{@merchant_1.id}/invoices")      
    end
  end

# As a merchant,
# When I visit my merchant dashboard
# Then I see the names of the top 5 customers
# who have conducted the largest number of successful transactions with my merchant
# And next to each customer name I see the number of successful transactions they have
# conducted with my merchant
  describe 'User Story 3' do
    it 'displays the top 5 customers (successful transactions)' do
      visit merchant_path(@merchant_1)

    end
    it 'displays the number of successful transactions of each customer'
  end
end