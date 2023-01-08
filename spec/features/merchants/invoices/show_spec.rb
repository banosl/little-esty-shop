require 'rails_helper'

RSpec.describe 'Merchant Invoice Show Page' do 
  before :each do 
    @merchant_1 = Merchant.create!(name: 'Schroeder-Jerde')
      
    @item_1 = @merchant_1.items.create!(name: 'Qui Esse', description: 'Nihil autem sit odio inventore deleniti', unit_price: 75107)
    @item_2 = @merchant_1.items.create!(name: 'Autem Minima', description: 'Cumque consequuntur ad', unit_price: 67076)
    @item_3 = @merchant_1.items.create!(name: 'Ea Voluptatum', description: 'Sunt officia eum qui molestiae', unit_price: 32301)
    @item_4 = @merchant_1.items.create!(name: 'Nemo Facere', description: 'Sunt eum id eius magni consequuntur delectus veritatis', unit_price: 4291)
  
    @customer_1 = Customer.create!(first_name: 'Joey', last_name: 'Ondricka')
    @customer_2 = Customer.create!(first_name: 'Cecelia', last_name: 'Osinski')
  
    @invoice_1 = @customer_1.invoices.create!(status: 'completed')
    @invoice_2 = @customer_2.invoices.create!(status: 'in progress', created_at: Time.new(2021))
  
    @invoice_item_1 = InvoiceItem.create!(invoice_id: @invoice_1.id,  item_id: @item_1.id, quantity: 5, unit_price: 13635, status: 'shipped')
    @invoice_item_2 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_3.id, quantity: 9, unit_price: 23324, status: 'shipped')
    @invoice_item_3 = InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item_2.id, quantity: 9, unit_price: 23324, status: 'shipped')
    @invoice_item_4 = InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item_4.id, quantity: 9, unit_price: 23324, status: 'shipped')
  end
  describe 'user story 15' do 
    # As a merchant
    # When I visit my merchant's invoice show page(/merchants/merchant_id/invoices/invoice_id)
    # Then I see information related to that invoice including:
    # - Invoice id
    # - Invoice status
    # - Invoice created_at date in the format "Monday, July 18, 2019"
    # - Customer first and last name
    it 'displays invoice attributes (id, status, created_at, customer name' do 
      visit merchant_invoice_path(@merchant_1.id, @invoice_1.id)

      expect(page).to have_content(@invoice_1.id)
      expect(page).to have_content(@invoice_1.status)
      expect(page).to have_content(@invoice_1.created_at.strftime("%A, %B %d, %Y"))
      expect(page).to have_content(@customer_1.full_name)
      expect(page).to_not have_content(@customer_2.full_name)

      visit merchant_invoice_path(@merchant_1.id, @invoice_2.id)

      expect(page).to have_content(@invoice_2.id)
      expect(page).to have_content(@invoice_2.status)
      expect(page).to have_content(@invoice_2.created_at.strftime("%A, %B %d, %Y"))
      expect(page).to have_content(@customer_2.full_name)
      expect(page).to_not have_content(@customer_1.full_name)
    end
  end

  # As a merchant
  # When I visit my merchant invoice show page
  # Then I see all of my items on the invoice including:
  # - Item name
  # - The quantity of the item ordered
  # - The price the Item sold for
  # - The Invoice Item status
  # And I do not see any information related to Items for other merchants
  describe 'user story 16' do 
    it 'displays all of the invoice items and attributes' do 
      visit merchant_invoice_path(@merchant_1.id, @invoice_1.id)

      expect(page).to have_content(@item_1.name)
      expect(page).to have_content(@invoice_item_1.quantity)
      expect(page).to have_content(@invoice_item_1.unit_price)
      expect(page).to have_content(@invoice_item_1.status)
      expect(page).to have_content(@item_3.name)
      expect(page).to have_content(@invoice_item_2.quantity)
      expect(page).to have_content(@invoice_item_2.unit_price)
      expect(page).to have_content(@invoice_item_2.status)

      visit merchant_invoice_path(@merchant_1.id, @invoice_2.id)

      expect(page).to have_content(@item_2.name)
      expect(page).to have_content(@invoice_item_3.quantity)
      expect(page).to have_content(@invoice_item_3.unit_price)
      expect(page).to have_content(@invoice_item_3.status)
      expect(page).to have_content(@item_4.name)
      expect(page).to have_content(@invoice_item_4.quantity)
      expect(page).to have_content(@invoice_item_4.unit_price)
      expect(page).to have_content(@invoice_item_4.status)
    end
  end
end