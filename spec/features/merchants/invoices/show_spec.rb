require 'rails_helper'

RSpec.describe 'Merchant Invoice Show Page' do 
  before :each do 
    @merchant_1 = Merchant.create!(name: 'Schroeder-Jerde')
    @merchant_2 = Merchant.create!(name: 'Catz')

    @item_1 = @merchant_1.items.create!(name: 'Qui Esse', description: 'Nihil autem sit odio inventore deleniti', unit_price: 75107)
    @item_2 = @merchant_1.items.create!(name: 'Autem Minima', description: 'Cumque consequuntur ad', unit_price: 67076)
    @item_3 = @merchant_1.items.create!(name: 'Ea Voluptatum', description: 'Sunt officia eum qui molestiae', unit_price: 32301)
    @item_4 = @merchant_1.items.create!(name: 'Nemo Facere', description: 'Sunt eum id eius magni consequuntur delectus veritatis', unit_price: 4291)
    @item_5 = @merchant_2.items.create!(name: 'Mer Hiufa', description: 'Suntius magni consequelectus veritatis', unit_price: 4221)
  
    @customer_1 = Customer.create!(first_name: 'Joey', last_name: 'Ondricka')
    @customer_2 = Customer.create!(first_name: 'Cecelia', last_name: 'Osinski')
    @customer_3 = Customer.create!(first_name: 'Jean', last_name: 'Henricks')
  
    @invoice_1 = @customer_1.invoices.create!(status: 'completed')
    @invoice_2 = @customer_2.invoices.create!(status: 'in progress', created_at: Time.new(2021))
    @invoice_3 = @customer_3.invoices.create!(status: 'in progress', created_at: Time.new(2021))
  
    @invoice_item_1 = InvoiceItem.create!(invoice_id: @invoice_1.id,  item_id: @item_1.id, quantity: 5, unit_price: 13635, status: 'shipped')
    @invoice_item_2 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_3.id, quantity: 9, unit_price: 23324, status: 'shipped')
    @invoice_item_3 = InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item_2.id, quantity: 9, unit_price: 23324, status: 'shipped')
    @invoice_item_4 = InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item_4.id, quantity: 9, unit_price: 23324, status: 'shipped')
    @invoice_item_5 = InvoiceItem.create!(invoice_id: @invoice_3.id, item_id: @item_5.id, quantity: 1, unit_price: 23784, status: 'shipped')
  end
  describe 'user story 15' do 
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

  describe 'user story 16' do 
    it 'displays all of the invoice items and attributes' do 
      visit merchant_invoice_path(@merchant_1.id, @invoice_1.id)

      expect(page).to have_content(@item_1.name)
      expect(page).to have_content(@invoice_item_1.quantity)
      expect(page).to have_content(@invoice_item_1.unit_price_in_dollars)
      expect(page).to have_content(@invoice_item_1.status)
      expect(page).to have_content(@item_3.name)
      expect(page).to have_content(@invoice_item_2.quantity)
      expect(page).to have_content(@invoice_item_2.unit_price_in_dollars)
      expect(page).to have_content(@invoice_item_2.status)
      expect(page).to have_content(@invoice_item_2.status)
      expect(page).to_not have_content(@item_5.name)

      visit merchant_invoice_path(@merchant_1.id, @invoice_2.id)

      expect(page).to have_content(@item_2.name)
      expect(page).to have_content(@invoice_item_3.quantity)
      expect(page).to have_content(@invoice_item_3.unit_price_in_dollars)
      expect(page).to have_content(@invoice_item_3.status)
      expect(page).to have_content(@item_4.name)
      expect(page).to have_content(@invoice_item_4.quantity)
      expect(page).to have_content(@invoice_item_4.unit_price_in_dollars)
      expect(page).to have_content(@invoice_item_4.status)
    end
  end
  
  describe 'user story 17' do
    it 'displays the total revenue from all items on the invoice' do 
      visit merchant_invoice_path(@merchant_1.id, @invoice_1.id)

      expect(page).to have_content(@invoice_1.total_revenue_in_dollars)
      expect(page).to_not have_content(@invoice_3.total_revenue_in_dollars)
    end
  end
  
  describe 'user story 18' do 
    it 'displays the invoice item status as a select field' do 
      visit merchant_invoice_path(@merchant_1.id, @invoice_1.id)

      within("#invoice_item-#{@invoice_item_1.id}") do
        expect(page).to have_field(:status, with: "shipped")
           
        select "packaged", from: :status
        click_button "Update Item Status"
      end      

      expect(find(:table, "Items")).to have_table_row("Item Name" => "#{@invoice_item_1.item_name}")
      expect(find(:table, "Items")).to have_table_row("Quantity" => "#{@invoice_item_1.quantity}")
      expect(find(:table, "Items")).to have_table_row("Unit Price" => "#{@invoice_item_1.unit_price_in_dollars}")
      expect(find(:table, "Items")).to have_table_row("Status" => "packaged")
      expect(current_path).to eq(merchant_invoice_path(@merchant_1.id, @invoice_1.id))
    end
  end
end