require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  describe 'relationships' do
    it {should belong_to :item}
    it {should belong_to :invoice}
    it {should have_many(:merchants).through(:invoice)}
    it {should have_many(:bulk_discounts).through(:merchants)}
  end

  describe 'validations' do
    it {should validate_presence_of :quantity}
    it {should validate_presence_of :unit_price}
    it {should validate_presence_of :status}
  end

  describe "Model Methods" do
    before :each do
      @merchant_1 = Merchant.create!(name: 'Schroeder-Jerde', status: :disabled)
      @merchant_2 = Merchant.create!(name: 'Rempel and Jones', status: :enabled)
      @merchant_3 = Merchant.create!(name: 'Willms and Sons', status: :disabled)

      #bulk_discounts
      @bulk_discount_1 = @merchant_1.bulk_discounts.create!({name: "10% Off", percent_discount: 10, quantity_threshold: 5})
      @bulk_discount_2 = @merchant_1.bulk_discounts.create!({name: "20% Off", percent_discount: 20, quantity_threshold: 15})
      @bulk_discount_3 = @merchant_1.bulk_discounts.create!({name: "30% Off", percent_discount: 30, quantity_threshold: 25})
      @bulk_discount_4 = @merchant_2.bulk_discounts.create!({name: "10% Off", percent_discount: 10, quantity_threshold: 15})
      @bulk_discount_5 = @merchant_2.bulk_discounts.create!({name: "25% Off", percent_discount: 25, quantity_threshold: 35})
      @bulk_discount_6 = @merchant_2.bulk_discounts.create!({name: "30% Off", percent_discount: 30, quantity_threshold: 45})

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

      @invoice_1 = @customer_1.invoices.create!(status: 'completed', created_at: Time.new(1920))
      @invoice_2 = @customer_1.invoices.create!(status: 'in progress', created_at: Time.new(2021))
      @invoice_3 = @customer_2.invoices.create!(status: 'in progress', created_at: Time.new(2022))

      @invoice_4 = @customer_2.invoices.create!(status: 'cancelled')
      @invoice_5 = @customer_3.invoices.create!(status: 'cancelled')
      @invoice_6 = @customer_3.invoices.create!(status: 'cancelled')
      @invoice_7 = @customer_4.invoices.create!(status: 'in progress', created_at: Time.new(1995))
      @invoice_8 = @customer_4.invoices.create!(status: 'cancelled')
      @invoice_9 = @customer_5.invoices.create!(status: 'cancelled')
      @invoice_10 = @customer_5.invoices.create!(status: 'cancelled')
      @invoice_11 = @customer_6.invoices.create!(status: 'cancelled')
      @invoice_12 = @customer_6.invoices.create!(status: 'cancelled')

      @invoice_item_1 = InvoiceItem.create!(invoice_id: @invoice_1.id,  item_id: @item_1.id, quantity: 5, unit_price: 13635, status: 'shipped')
      @invoice_item_2 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_2.id, quantity: 9, unit_price: 23324, status: 'shipped')

      @invoice_item_3 = InvoiceItem.create!(invoice_id: @invoice_2.id,  item_id: @item_2.id, quantity: 12, unit_price: 34873, status: 'packaged')
      @invoice_item_4 = InvoiceItem.create!(invoice_id: @invoice_2.id,  item_id: @item_4.id, quantity: 16, unit_price: 2196, status: 'pending')
      @invoice_item_5 = InvoiceItem.create!(invoice_id: @invoice_2.id,  item_id: @item_5.id, quantity: 3, unit_price: 79140, status: 'packaged')
      @invoice_item_6 = InvoiceItem.create!(invoice_id: @invoice_2.id,  item_id: @item_1.id, quantity: 39, unit_price: 52100, status: 'shipped')

      @invoice_item_8 = InvoiceItem.create!(invoice_id: @invoice_3.id,  item_id: @item_2.id, quantity: 4, unit_price: 66747, status: 'shipped')
      @invoice_item_9 = InvoiceItem.create!(invoice_id: @invoice_3.id,  item_id: @item_8.id, quantity: 9, unit_price: 76941, status: 'packaged')
      #transactions
        @transaction_1 = @invoice_1.transactions.create!(credit_card_number: '4654405418249632', credit_card_expiration_date: '04/22/20', result: 'success')
        @transaction_2 = @invoice_1.transactions.create!(credit_card_number: '4654405418249632', credit_card_expiration_date: '04/22/20', result: 'failed')
        @transaction_3 = @invoice_1.transactions.create!(credit_card_number: '4654405418249632', credit_card_expiration_date: '04/22/20', result: 'success')

        @transaction_4 = @invoice_2.transactions.create!(credit_card_number: '4580251236515201', credit_card_expiration_date: '03/22/20', result: 'failed')
        @transaction_5 = @invoice_2.transactions.create!(credit_card_number: '4580251236515201', credit_card_expiration_date: '03/22/20', result: 'failed')
        @transaction_6 = @invoice_2.transactions.create!(credit_card_number: '4580251236515201', credit_card_expiration_date: '03/22/20', result: 'failed')

        @transaction_7 = @invoice_3.transactions.create!(credit_card_number: '4354495077693036', credit_card_expiration_date: '09/22/20', result: 'failed')
        @transaction_8 = @invoice_3.transactions.create!(credit_card_number: '4354495077693036', credit_card_expiration_date: '09/22/20', result: 'success')
        @transaction_9 = @invoice_3.transactions.create!(credit_card_number: '4354495077693036', credit_card_expiration_date: '09/22/20', result: 'success')

        @transaction_10 = @invoice_4.transactions.create!(credit_card_number: '4515551623735607', credit_card_expiration_date: '08/22/20', result: 'success')
        @transaction_11 = @invoice_4.transactions.create!(credit_card_number: '4515551623735607', credit_card_expiration_date: '08/22/20', result: 'success')
        @transaction_12 = @invoice_4.transactions.create!(credit_card_number: '4515551623735607', credit_card_expiration_date: '08/22/20', result: 'success')

        @transaction_13 = @invoice_5.transactions.create!(credit_card_number: '4844518708741275', credit_card_expiration_date: '10/22/20', result: 'success')
        @transaction_14 = @invoice_5.transactions.create!(credit_card_number: '4844518708741275', credit_card_expiration_date: '10/22/20', result: 'success')
        @transaction_15 = @invoice_5.transactions.create!(credit_card_number: '4844518708741275', credit_card_expiration_date: '10/22/20', result: 'success')

        @transaction_16 = @invoice_6.transactions.create!(credit_card_number: '4203696133194408', credit_card_expiration_date: '02/22/20', result: 'failed')
        @transaction_17 = @invoice_6.transactions.create!(credit_card_number: '4203696133194408', credit_card_expiration_date: '02/22/20', result: 'failed')
        @transaction_18 = @invoice_6.transactions.create!(credit_card_number: '4203696133194408', credit_card_expiration_date: '02/22/20', result: 'success')

        @transaction_19 = @invoice_7.transactions.create!(credit_card_number: '4801647818676136', credit_card_expiration_date: '01/22/20', result: 'failed')
        @transaction_20 = @invoice_7.transactions.create!(credit_card_number: '4801647818676136', credit_card_expiration_date: '01/22/20', result: 'failed')
        @transaction_21 = @invoice_7.transactions.create!(credit_card_number: '4801647818676136', credit_card_expiration_date: '01/22/20', result: 'failed')

        @transaction_22 = @invoice_8.transactions.create!(credit_card_number: '4540842003561938', credit_card_expiration_date: '09/22/20', result: 'success')
        @transaction_23 = @invoice_8.transactions.create!(credit_card_number: '4540842003561938', credit_card_expiration_date: '09/22/20', result: 'failed')
        @transaction_24 = @invoice_8.transactions.create!(credit_card_number: '4540842003561938', credit_card_expiration_date: '09/22/20', result: 'failed')

        @transaction_25 = @invoice_9.transactions.create!(credit_card_number: '4140149827486249', credit_card_expiration_date: '10/22/20', result: 'failed')
        @transaction_26 = @invoice_9.transactions.create!(credit_card_number: '4140149827486249', credit_card_expiration_date: '10/22/20', result: 'failed')
        @transaction_27 = @invoice_9.transactions.create!(credit_card_number: '4140149827486249', credit_card_expiration_date: '10/22/20', result: 'failed')

        @transaction_28 = @invoice_10.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'success')
        @transaction_29 = @invoice_10.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'success')
        @transaction_30 = @invoice_10.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'success')

        @transaction_31 = @invoice_11.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'success')
        @transaction_32 = @invoice_11.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'success')
        @transaction_33 = @invoice_11.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'success')

        @transaction_34 = @invoice_12.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'success')
        @transaction_35 = @invoice_12.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'success')
        @transaction_36 = @invoice_12.transactions.create!(credit_card_number: '4923661117104166', credit_card_expiration_date: '08/22/20', result: 'success')
    end

    describe 'unit_price_in_dollars' do
      it 'turns the cents into dollars' do
        expect(@invoice_item_1.unit_price_in_dollars).to eq(136.35)
        expect(@invoice_item_2.unit_price_in_dollars).to eq(233.24)
        expect(@invoice_item_3.unit_price_in_dollars).to eq(348.73)
      end
    end

    describe "item_name" do
      it 'returns the name for the item on InvoiceItem' do
        expect(@invoice_item_1.item_name).to eq("Qui Esse")
        expect(@invoice_item_2.item_name).to eq("Autem Minima")
        expect(@invoice_item_4.item_name).to eq("Nemo Facere")
      end
    end

    describe "discount applied" do
      it 'returns the discount applied to the invoice_item if any' do
        expect(@invoice_item_1.discount_applied).to eq("10% Off")
        expect(@invoice_item_4.discount_applied).to eq("20% Off")
        expect(@invoice_item_6.discount_applied).to eq("30% Off")
        expect(@invoice_item_8.discount_applied).to eq(nil)
      end
    end
  end
end