require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it {should belong_to :merchant}
    it {should have_many :invoice_items}
    it {should have_many(:invoices).through(:invoice_items)}
    it {should have_many(:customers).through(:invoices)}
    it {should have_many(:transactions).through(:invoices)}
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
    it {should validate_presence_of :unit_price}
  end

  describe 'class methods' do
    before :each do 
      @merchant_1 = Merchant.create!(name: 'Schroeder-Jerde')
    
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
      @invoice_11 = @customer_2.invoices.create!(status: 'in progress')
      @invoice_12 = @customer_2.invoices.create!(status: 'completed')
      @invoice_13 = @customer_2.invoices.create!(status: 'completed')
      @invoice_14 = @customer_2.invoices.create!(status: 'completed')
      @invoice_15 = @customer_2.invoices.create!(status: 'completed')
      @invoice_16 = @customer_2.invoices.create!(status: 'completed')
      @invoice_17 = @customer_2.invoices.create!(status: 'completed')
      @invoice_18 = @customer_2.invoices.create!(status: 'in progress')

      @invoice_item_1 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_1.id, quantity: 5, unit_price: 13635, status: 'packaged')
      @invoice_item_2 = InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item_1.id, quantity: 9, unit_price: 23324, status: 'pending')
      @invoice_item_3 = InvoiceItem.create!(invoice_id: @invoice_3.id, item_id: @item_1.id, quantity: 12, unit_price: 34873, status: 'packaged')
      @invoice_item_4 = InvoiceItem.create!(invoice_id: @invoice_4.id, item_id: @item_1.id, quantity: 8, unit_price: 2196, status: 'pending')
      @invoice_item_5 = InvoiceItem.create!(invoice_id: @invoice_5.id, item_id: @item_1.id, quantity: 3, unit_price: 79140, status: 'packaged')
      @invoice_item_6 = InvoiceItem.create!(invoice_id: @invoice_6.id, item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
      @invoice_item_7 = InvoiceItem.create!(invoice_id: @invoice_7.id, item_id: @item_1.id, quantity: 10, unit_price: 66747, status: 'shipped')
      @invoice_item_8 = InvoiceItem.create!(invoice_id: @invoice_8.id, item_id: @item_2.id, quantity: 9, unit_price: 76941, status: 'packaged')
      @invoice_item_9 = InvoiceItem.create!(invoice_id: @invoice_9.id, item_id: @item_2.id, quantity: 3, unit_price: 79140, status: 'packaged')
      @invoice_item_10 = InvoiceItem.create!(invoice_id: @invoice_10.id, item_id: @item_2.id, quantity: 9, unit_price: 52100, status: 'shipped')
      @invoice_item_11 = InvoiceItem.create!(invoice_id: @invoice_11.id, item_id: @item_2.id, quantity: 10, unit_price: 66747, status: 'shipped')
      @invoice_item_12 = InvoiceItem.create!(invoice_id: @invoice_12.id, item_id: @item_2.id, quantity: 9, unit_price: 76941, status: 'packaged')
      @invoice_item_13 = InvoiceItem.create!(invoice_id: @invoice_13.id, item_id: @item_2.id, quantity: 9, unit_price: 76941, status: 'packaged')
      @invoice_item_14 = InvoiceItem.create!(invoice_id: @invoice_14.id, item_id: @item_2.id, quantity: 9, unit_price: 76941, status: 'packaged')
      @invoice_item_15 = InvoiceItem.create!(invoice_id: @invoice_15.id, item_id: @item_2.id, quantity: 9, unit_price: 76941, status: 'packaged')
      @invoice_item_16 = InvoiceItem.create!(invoice_id: @invoice_16.id, item_id: @item_2.id, quantity: 9, unit_price: 76941, status: 'packaged')
      @invoice_item_17 = InvoiceItem.create!(invoice_id: @invoice_17.id, item_id: @item_2.id, quantity: 9, unit_price: 76941, status: 'packaged')
      @invoice_item_18 = InvoiceItem.create!(invoice_id: @invoice_18.id, item_id: @item_2.id, quantity: 9, unit_price: 76941, status: 'packaged')
      
      @transaction_1 = @invoice_1.transactions.create!(credit_card_number: '4654405418249632', credit_card_expiration_date: '04/22/20', result: 'failed')
      @transaction_2 = @invoice_1.transactions.create!(credit_card_number: '4654405418249632', credit_card_expiration_date: '04/22/20', result: 'success')
      
      @transaction_3 = @invoice_2.transactions.create!(credit_card_number: '4580251236515201', credit_card_expiration_date: '03/22/20', result: 'failed')
      @transaction_4 = @invoice_3.transactions.create!(credit_card_number: '4354495077693036', credit_card_expiration_date: '09/22/20', result: 'success')
      @transaction_5 = @invoice_4.transactions.create!(credit_card_number: '4515551623735607', credit_card_expiration_date: '08/22/20', result: 'success')
      @transaction_6 = @invoice_5.transactions.create!(credit_card_number: '4203696133194408', credit_card_expiration_date: '02/22/20', result: 'success')
      @transaction_7 = @invoice_7.transactions.create!(credit_card_number: '4801647818676136', credit_card_expiration_date: '01/22/20', result: 'failed')
      @transaction_8 = @invoice_7.transactions.create!(credit_card_number: '4540842003561938', credit_card_expiration_date: '09/22/20', result: 'success')
      
      @transaction_9 = @invoice_9.transactions.create!(credit_card_number: '4140149827486249', credit_card_expiration_date: '10/22/20', result: 'failed')
      @transaction_10 = @invoice_9.transactions.create!(credit_card_number: '4140149827486249', credit_card_expiration_date: '08/22/20', result: 'failed')
      @transaction_11 = @invoice_9.transactions.create!(credit_card_number: '4140149827486249', credit_card_expiration_date: '08/22/20', result: 'failed')
      
      @transaction_12 = @invoice_10.transactions.create!(credit_card_number: '4017503416578382', credit_card_expiration_date: '08/22/20', result: 'success')
      @transaction_13 = @invoice_11.transactions.create!(credit_card_number: '9856503416578382', credit_card_expiration_date: '08/25/20', result: 'failed')
      @transaction_14 = @invoice_11.transactions.create!(credit_card_number: '9856503416578382', credit_card_expiration_date: '08/25/20', result: 'failed')

      @transaction_15 = @invoice_13.transactions.create!(credit_card_number: '6565503416578382', credit_card_expiration_date: '08/29/20', result: 'success')
      @transaction_16 = @invoice_14.transactions.create!(credit_card_number: '6225503416578382', credit_card_expiration_date: '08/29/20', result: 'success')
      @transaction_17 = @invoice_15.transactions.create!(credit_card_number: '6965503416578381', credit_card_expiration_date: '08/29/20', result: 'success')
      @transaction_18 = @invoice_16.transactions.create!(credit_card_number: '6965503416578333', credit_card_expiration_date: '08/29/20', result: 'success')
      @transaction_19 = @invoice_17.transactions.create!(credit_card_number: '6965503416578390', credit_card_expiration_date: '08/29/20', result: 'success')
      
      @transaction_20 = @invoice_18.transactions.create!(credit_card_number: '6965503416578382', credit_card_expiration_date: '08/29/20', result: 'failed')
      @transaction_21 = @invoice_18.transactions.create!(credit_card_number: '6965503416578382', credit_card_expiration_date: '08/29/20', result: 'failed')
      @transaction_22 = @invoice_18.transactions.create!(credit_card_number: '6965503416578382', credit_card_expiration_date: '08/29/20', result: 'success')
    end

# As a merchant
# When I visit my items index page
# Then I see the names of the top 5 most popular items ranked by total revenue generated

# Notes on Revenue Calculation:
# - Only invoices with at least one successful transaction should count towards revenue
    describe 'class methods' do
      describe '#revenue_for_invoice' do
        xit 'returns the revenue for an invoice' do
          # - Revenue for an invoice should be calculated as the sum of the revenue of all invoice items
        end
      end
      
      describe '#revenue_for_invoice_item' do
        it 'can return the revenue for an invoice item' do
          # - Revenue for an invoice item should be calculated as 
          # the invoice item unit price multiplied by the quantity (do not use the item unit price) 
        end 
      end

      describe '#top_5_items_by_revenue' do
        xit 'returns the top 5 items based off revenue generated' do

        end
      end
    end
  end
end


