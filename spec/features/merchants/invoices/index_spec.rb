require 'rails_helper'

RSpec.describe 'Merchant Invoices Index Page' do 
  before :each do 
    @merchant_1 = Merchant.create!(name: 'Schroeder-Jerde')
    
    @item_1 = @merchant_1.items.create!(name: 'Qui Esse', description: 'Nihil autem sit odio inventore deleniti', unit_price: 75107)
    @item_2 = @merchant_1.items.create!(name: 'Autem Minima', description: 'Cumque consequuntur ad', unit_price: 67076)
    @item_3 = @merchant_1.items.create!(name: 'Ea Voluptatum', description: 'Sunt officia eum qui molestiae', unit_price: 32301)
    @item_4 = @merchant_1.items.create!(name: 'Nemo Facere', description: 'Sunt eum id eius magni consequuntur delectus veritatis', unit_price: 4291)

    @customer_1 = Customer.create!(first_name: 'Joey', last_name: 'Ondricka')
    @customer_2 = Customer.create!(first_name: 'Cecelia', last_name: 'Osinski')
    @customer_3 = Customer.create!(first_name: 'Mariah', last_name: 'Toy')
    @customer_4 = Customer.create!(first_name: 'Leanna', last_name: 'Braun')
    @customer_5 = Customer.create!(first_name: 'Leanna', last_name: 'Braun')

    @invoice_1 = @customer_1.invoices.create!(status: 'completed')
    @invoice_2 = @customer_2.invoices.create!(status: 'in progress', created_at: Time.new(2021))
    @invoice_3 = @customer_3.invoices.create!(status: 'in progress', created_at: Time.new(2022))
    @invoice_4 = @customer_4.invoices.create!(status: 'cancelled')
    @invoice_5 = @customer_5.invoices.create!(status: 'cancelled')

    InvoiceItem.create!(invoice_id: @invoice_1.id,  item_id: @item_1.id, quantity: 5, unit_price: 13635, status: 'shipped')
    InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item_2.id, quantity: 9, unit_price: 23324, status: 'shipped')
    InvoiceItem.create!(invoice_id: @invoice_3.id,  item_id: @item_3.id, quantity: 12, unit_price: 34873, status: 'packaged')
    InvoiceItem.create!(invoice_id: @invoice_4.id,  item_id: @item_4.id, quantity: 8, unit_price: 2196, status: 'pending')

  end
  # As a merchant,
  # When I visit my merchant's invoices index (/merchants/merchant_id/invoices)
  # Then I see all of the invoices that include at least one of my merchant's items
  # And for each invoice I see its id
  # And each id links to the merchant invoice show page
  describe 'user story 14' do
    it 'displays all of the invoices that include one or more of my merchants items including invoice id link' do 
      visit merchant_invoices_path(@merchant_1.id)

      expect(page).to have_content("All Invoices")
      expect(page).to have_link("Invoice ##{@invoice_1.id}", :href => "/merchants/invoices/#{@invoice_1.id}")
      expect(page).to have_link("Invoice ##{@invoice_2.id}", :href => "/merchants/invoices/#{@invoice_2.id}")
      expect(page).to have_link("Invoice ##{@invoice_3.id}", :href => "/merchants/invoices/#{@invoice_3.id}")
      expect(page).to have_link("Invoice ##{@invoice_4.id}", :href => "/merchants/invoices/#{@invoice_4.id}")
      expect(page).to_not have_link("Invoice ##{@invoice_5.id}", :href => "/merchants/invoices/#{@invoice_5.id}")
    end
  end
end