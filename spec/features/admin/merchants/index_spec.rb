require 'rails_helper'

RSpec.describe "Admin/Merchant/Index" do
  describe 'visiting admin merchant index' do

    describe 'User Story 24' do
      before :each do
        @merchant_1 = Merchant.create!(name: 'Schroeder-Jerde', status: :disabled)
        @merchant_2 = Merchant.create!(name: 'Rempel and Jones', status: :enabled)
        @merchant_3 = Merchant.create!(name: 'Willms and Sons', status: :disabled)
        @merchant_4 = Merchant.create!(name: 'Merchant 4', status: :disabled)
        @merchant_5 = Merchant.create!(name: 'Merchant 5', status: :enabled)
        @merchant_6 = Merchant.create!(name: 'Merchant 6', status: :disabled)
  
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
  
        @invoice_1 = @customer_1.invoices.create!(status: 'completed')
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
  
        #do i have to calculate the actual unit_price?
        InvoiceItem.create!(invoice_id: @invoice_1.id,  item_id: @item_1.id, quantity: 5, unit_price: 13635, status: 'shipped')
        InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_2.id, quantity: 9, unit_price: 23324, status: 'shipped')
  
        InvoiceItem.create!(invoice_id: @invoice_2.id,  item_id: @item_2.id, quantity: 12, unit_price: 34873, status: 'packaged')
        InvoiceItem.create!(invoice_id: @invoice_2.id,  item_id: @item_4.id, quantity: 8, unit_price: 2196, status: 'pending')
        InvoiceItem.create!(invoice_id: @invoice_2.id,  item_id: @item_5.id, quantity: 3, unit_price: 79140, status: 'packaged')
        InvoiceItem.create!(invoice_id: @invoice_2.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
  
        InvoiceItem.create!(invoice_id: @invoice_3.id,  item_id: @item_7.id, quantity: 10, unit_price: 66747, status: 'shipped')
        InvoiceItem.create!(invoice_id: @invoice_3.id,  item_id: @item_8.id, quantity: 9, unit_price: 76941, status: 'packaged')
  
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
      it 'see the name of each mercahnt in the system' do
        visit "admin/merchants"

        expect(page).to have_content("#{@merchant_1.name}")
        expect(page).to have_content("#{@merchant_2.name}")
        expect(page).to have_content("#{@merchant_3.name}")
      end
    end

    describe 'User Story 25' do
      before :each do
        @merchant_1 = Merchant.create!(name: 'Schroeder-Jerde', status: :disabled)
        @merchant_2 = Merchant.create!(name: 'Rempel and Jones', status: :enabled)
        @merchant_3 = Merchant.create!(name: 'Willms and Sons', status: :disabled)
        @merchant_4 = Merchant.create!(name: 'Merchant 4', status: :disabled)
        @merchant_5 = Merchant.create!(name: 'Merchant 5', status: :enabled)
        @merchant_6 = Merchant.create!(name: 'Merchant 6', status: :disabled)
  
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
  
        @invoice_1 = @customer_1.invoices.create!(status: 'completed')
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
  
        #do i have to calculate the actual unit_price?
        InvoiceItem.create!(invoice_id: @invoice_1.id,  item_id: @item_1.id, quantity: 5, unit_price: 13635, status: 'shipped')
        InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_2.id, quantity: 9, unit_price: 23324, status: 'shipped')
  
        InvoiceItem.create!(invoice_id: @invoice_2.id,  item_id: @item_2.id, quantity: 12, unit_price: 34873, status: 'packaged')
        InvoiceItem.create!(invoice_id: @invoice_2.id,  item_id: @item_4.id, quantity: 8, unit_price: 2196, status: 'pending')
        InvoiceItem.create!(invoice_id: @invoice_2.id,  item_id: @item_5.id, quantity: 3, unit_price: 79140, status: 'packaged')
        InvoiceItem.create!(invoice_id: @invoice_2.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
  
        InvoiceItem.create!(invoice_id: @invoice_3.id,  item_id: @item_7.id, quantity: 10, unit_price: 66747, status: 'shipped')
        InvoiceItem.create!(invoice_id: @invoice_3.id,  item_id: @item_8.id, quantity: 9, unit_price: 76941, status: 'packaged')
  
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
      it "click on the name of a merchant from the admin merchants index page, user is taken to the merchant's admin show page (/admin/merchants/merchant_id) user sees the name of that merchant" do
        visit "admin/merchants"
     
        
        within("#disabled_merchants") do 
          click_link "#{@merchant_1.name}"
        end 

        expect(page).to have_content("#{@merchant_1.name}")
        expect(page).to_not have_content("#{@merchant_2.name}")
        expect(current_path).to eq("/admin/merchants/#{@merchant_1.id}")

        click_link "Merchants"
        
        click_link "#{@merchant_2.name}"
        expect(page).to have_content("#{@merchant_2.name}")
        expect(page).to_not have_content("#{@merchant_3.name}")
        expect(current_path).to eq("/admin/merchants/#{@merchant_2.id}")
      end
    end

    describe 'user story 27' do 
      before :each do
        @merchant_1 = Merchant.create!(name: 'Schroeder-Jerde', status: :disabled)
        @merchant_2 = Merchant.create!(name: 'Rempel and Jones', status: :enabled)
        @merchant_3 = Merchant.create!(name: 'Willms and Sons', status: :disabled)
        @merchant_4 = Merchant.create!(name: 'Merchant 4', status: :disabled)
        @merchant_5 = Merchant.create!(name: 'Merchant 5', status: :enabled)
        @merchant_6 = Merchant.create!(name: 'Merchant 6', status: :disabled)
  
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
  
        @invoice_1 = @customer_1.invoices.create!(status: 'completed')
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
  
        #do i have to calculate the actual unit_price?
        InvoiceItem.create!(invoice_id: @invoice_1.id,  item_id: @item_1.id, quantity: 5, unit_price: 13635, status: 'shipped')
        InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_2.id, quantity: 9, unit_price: 23324, status: 'shipped')
  
        InvoiceItem.create!(invoice_id: @invoice_2.id,  item_id: @item_2.id, quantity: 12, unit_price: 34873, status: 'packaged')
        InvoiceItem.create!(invoice_id: @invoice_2.id,  item_id: @item_4.id, quantity: 8, unit_price: 2196, status: 'pending')
        InvoiceItem.create!(invoice_id: @invoice_2.id,  item_id: @item_5.id, quantity: 3, unit_price: 79140, status: 'packaged')
        InvoiceItem.create!(invoice_id: @invoice_2.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
  
        InvoiceItem.create!(invoice_id: @invoice_3.id,  item_id: @item_7.id, quantity: 10, unit_price: 66747, status: 'shipped')
        InvoiceItem.create!(invoice_id: @invoice_3.id,  item_id: @item_8.id, quantity: 9, unit_price: 76941, status: 'packaged')
  
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
      it 'displays enable and disable buttons next to each merchant' do 
        visit '/admin/merchants'
        expect(page).to have_button("enable", id: @merchant_1.id)
        expect(page).to have_button("disable", id: @merchant_2.id)
        expect(page).to have_button("enable", id: @merchant_3.id)
      end

      it 'updates the status of a merchant upon pressing the enable or disable button, then refreshes the screen' do 
        visit '/admin/merchants'
        expect(page).to have_button("enable", id: @merchant_1.id)
        expect(@merchant_1.status).to eq('disabled')
        click_button(id: @merchant_1.id)
        @merchant_1.reload
        expect(@merchant_1.status).to eq('enabled')
      end
    end

    describe 'user story 28' do 
      before :each do
        @merchant_1 = Merchant.create!(name: 'Schroeder-Jerde', status: :disabled)
        @merchant_2 = Merchant.create!(name: 'Rempel and Jones', status: :enabled)
        @merchant_3 = Merchant.create!(name: 'Willms and Sons', status: :disabled)
        @merchant_4 = Merchant.create!(name: 'Merchant 4', status: :disabled)
        @merchant_5 = Merchant.create!(name: 'Merchant 5', status: :enabled)
        @merchant_6 = Merchant.create!(name: 'Merchant 6', status: :disabled)
  
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
  
        @invoice_1 = @customer_1.invoices.create!(status: 'completed')
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
  
        #do i have to calculate the actual unit_price?
        InvoiceItem.create!(invoice_id: @invoice_1.id,  item_id: @item_1.id, quantity: 5, unit_price: 13635, status: 'shipped')
        InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_2.id, quantity: 9, unit_price: 23324, status: 'shipped')
  
        InvoiceItem.create!(invoice_id: @invoice_2.id,  item_id: @item_2.id, quantity: 12, unit_price: 34873, status: 'packaged')
        InvoiceItem.create!(invoice_id: @invoice_2.id,  item_id: @item_4.id, quantity: 8, unit_price: 2196, status: 'pending')
        InvoiceItem.create!(invoice_id: @invoice_2.id,  item_id: @item_5.id, quantity: 3, unit_price: 79140, status: 'packaged')
        InvoiceItem.create!(invoice_id: @invoice_2.id,  item_id: @item_1.id, quantity: 9, unit_price: 52100, status: 'shipped')
  
        InvoiceItem.create!(invoice_id: @invoice_3.id,  item_id: @item_7.id, quantity: 10, unit_price: 66747, status: 'shipped')
        InvoiceItem.create!(invoice_id: @invoice_3.id,  item_id: @item_8.id, quantity: 9, unit_price: 76941, status: 'packaged')
  
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
      it 'displays enabled and disabled merchant sections' do
        visit '/admin/merchants' 
        
        expect(page).to have_content("Enabled Merchants")
        expect(page).to have_content("Disabled Merchants")
      end

      it 'displays only enabled merchants in enabled_merchants section' do 
        visit '/admin/merchants' 

        within('#enabled_merchants') do 
          expect(page).to have_content('Rempel and Jones')
          expect(page).to_not have_content('Willms and Sons')
          expect(page).to_not have_content('Schroeder-Jerde')
        end

        within('#disabled_merchants') do 
          expect(page).to_not have_content('Rempel and Jones')
          expect(page).to have_content('Willms and Sons')
          expect(page).to have_content('Schroeder-Jerde')  
        end
      end
    end

    describe 'user story 30' do 
      before :each do 
        @merchant_1 = Merchant.create!(name: 'Merchant 1')
        @merchant_2 = Merchant.create!(name: 'Merchant 2', status: :enabled)
        @merchant_3 = Merchant.create!(name: 'Merchant 3', status: :disabled)
        @merchant_4 = Merchant.create!(name: 'Merchant 4', status: :disabled)
        @merchant_5 = Merchant.create!(name: 'Merchant 5', status: :enabled)
        @merchant_6 = Merchant.create!(name: 'Merchant 6', status: :disabled)
        @merchant_7 = Merchant.create!(name: 'Merchant 6', status: :disabled)
          
        @item_1 = @merchant_1.items.create!(name: 'Qui Esse', description: 'Nihil autem sit odio inventore deleniti', unit_price: 75107)
        @item_2 = @merchant_2.items.create!(name: 'Autem Minima', description: 'Cumque consequuntur ad', unit_price: 67076)
        @item_3 = @merchant_3.items.create!(name: 'Ea Voluptatum', description: 'Sunt officia eum qui molestiae', unit_price: 32301)
        @item_4 = @merchant_4.items.create!(name: 'Nemo Facere', description: 'Sunt eum id eius magni consequuntur delectus veritatis', unit_price: 4291)
        @item_5 = @merchant_5.items.create!(name: 'Expedita Aliquam', description: 'Voluptate aut labore qui illum tempore eius. Corrupti cum et rerum', unit_price: 68723)
        @item_6 = @merchant_6.items.create!(name: 'Provident At', description: 'Numquam officiis reprehenderit eum ratione neque tenetur', unit_price: 15925)
        @item_7 = @merchant_7.items.create!(name: 'Provident At', description: 'Numquam officiis reprehenderit eum ratione neque tenetur', unit_price: 15925)
  
        # @item_8 = @merchant_1.items.create!(name: 'Est Consequuntur', description: 'Reprehenderit est officiis cupiditate quia eos', unit_price: 34355)
        # @item_9 = @merchant_1.items.create!(name: 'Quo Magnam', description: 'Culpa deleniti adipisci voluptates aut. Sed eum quisquam nisi', unit_price: 22582)
        # @item_10 = @merchant_1.items.create!(name: 'Quidem Suscipit', description: 'Reiciendis sed aperiam culpa animi laudantium', unit_price: 34018)
  
        @customer_1 = Customer.create!(first_name: 'Joey', last_name: 'Ondricka')
  
        @invoice_1 = @customer_1.invoices.create!(status: 'completed')
        @invoice_2 = @customer_1.invoices.create!(status: 'completed')
        @invoice_3 = @customer_1.invoices.create!(status: 'completed')
        @invoice_4 = @customer_1.invoices.create!(status: 'completed')
        @invoice_5 = @customer_1.invoices.create!(status: 'completed')
        @invoice_6 = @customer_1.invoices.create!(status: 'completed')
        @invoice_7 = @customer_1.invoices.create!(status: 'completed')
  
        @invoice_item_1 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_1.id, quantity: 5, unit_price: 50, status: 'packaged')
        @invoice_item_2 = InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item_2.id, quantity: 5, unit_price: 100, status: 'packaged')
        @invoice_item_3 = InvoiceItem.create!(invoice_id: @invoice_3.id, item_id: @item_3.id, quantity: 5, unit_price: 42, status: 'packaged')
        @invoice_item_4 = InvoiceItem.create!(invoice_id: @invoice_4.id, item_id: @item_4.id, quantity: 5, unit_price: 66, status: 'packaged')
        @invoice_item_5 = InvoiceItem.create!(invoice_id: @invoice_5.id, item_id: @item_5.id, quantity: 5, unit_price: 300, status: 'packaged')
        @invoice_item_6 = InvoiceItem.create!(invoice_id: @invoice_6.id, item_id: @item_6.id, quantity: 5, unit_price: 40, status: 'packaged')
        @invoice_item_7 = InvoiceItem.create!(invoice_id: @invoice_7.id, item_id: @item_7.id, quantity: 5, unit_price: 999, status: 'packaged')

        @invoice_item_8 = InvoiceItem.create!(invoice_id: @invoice_7.id, item_id: @item_1.id, quantity: 5, unit_price: 100, status: 'packaged')
  
        @transaction_1 = @invoice_1.transactions.create!(credit_card_number: '4654405418249632', credit_card_expiration_date: '04/22/20', result: 'success')
        @transaction_2 = @invoice_2.transactions.create!(credit_card_number: '4654405418249632', credit_card_expiration_date: '04/22/20', result: 'success')
        @transaction_3 = @invoice_3.transactions.create!(credit_card_number: '4654405418249632', credit_card_expiration_date: '04/22/20', result: 'success')
        @transaction_4 = @invoice_4.transactions.create!(credit_card_number: '4654405418249632', credit_card_expiration_date: '04/22/20', result: 'success')
        @transaction_5 = @invoice_5.transactions.create!(credit_card_number: '4654405418249632', credit_card_expiration_date: '04/22/20', result: 'success')
        @transaction_6 = @invoice_6.transactions.create!(credit_card_number: '4654405418249632', credit_card_expiration_date: '04/22/20', result: 'success')
        @transaction_7 = @invoice_7.transactions.create!(credit_card_number: '4654405418249632', credit_card_expiration_date: '04/22/20', result: 'failed')
      end

      it 'displays top 5 merchants based on total revenue generated' do 
      
        visit admin_merchants_path
        within('#top_merchants') do 
          expect(page).to have_content('Top 5 Merchants')
          expect(@merchant_5.name).to appear_before(@merchant_1.name)
          expect(@merchant_1.name).to appear_before(@merchant_2.name)
          expect(@merchant_2.name).to appear_before(@merchant_4.name)
          expect(@merchant_4.name).to appear_before(@merchant_3.name)
        end
      end

      it 'displays top 5 merchants as links to their respective pages' do 
        visit admin_merchants_path
        within('#top_merchants') do 
          expect(page).to have_link(@merchant_5.name)
          click_link(@merchant_5.name)
          expect(current_path).to eq("/admin/merchants/#{@merchant_5.id}")
        end
      end


      it 'displays the total revenue next to each merchant' do 
        visit admin_merchants_path
        within("#link_to_merchant_#{@merchant_1.id}") do 
          expect(page).to have_content("$7.50")
        end
      end
    end

    describe 'user story 31' do 
      before :each do 
        @merchant_1 = Merchant.create!(name: 'Merchant 1')
        @merchant_2 = Merchant.create!(name: 'Merchant 2', status: :enabled)
        @merchant_3 = Merchant.create!(name: 'Merchant 3', status: :disabled)
        @merchant_4 = Merchant.create!(name: 'Merchant 4', status: :disabled)
        @merchant_5 = Merchant.create!(name: 'Merchant 5', status: :enabled)
        @merchant_6 = Merchant.create!(name: 'Merchant 6', status: :disabled)
        @merchant_7 = Merchant.create!(name: 'Merchant 6', status: :disabled)
          
        @item_1 = @merchant_1.items.create!(name: 'Qui Esse', description: 'Nihil autem sit odio inventore deleniti', unit_price: 75107)
        @item_2 = @merchant_2.items.create!(name: 'Autem Minima', description: 'Cumque consequuntur ad', unit_price: 67076)
        @item_3 = @merchant_3.items.create!(name: 'Ea Voluptatum', description: 'Sunt officia eum qui molestiae', unit_price: 32301)
        @item_4 = @merchant_4.items.create!(name: 'Nemo Facere', description: 'Sunt eum id eius magni consequuntur delectus veritatis', unit_price: 4291)
        @item_5 = @merchant_5.items.create!(name: 'Expedita Aliquam', description: 'Voluptate aut labore qui illum tempore eius. Corrupti cum et rerum', unit_price: 68723)
        @item_6 = @merchant_6.items.create!(name: 'Provident At', description: 'Numquam officiis reprehenderit eum ratione neque tenetur', unit_price: 15925)
        @item_7 = @merchant_7.items.create!(name: 'Provident At', description: 'Numquam officiis reprehenderit eum ratione neque tenetur', unit_price: 15925)
  
        # @item_8 = @merchant_1.items.create!(name: 'Est Consequuntur', description: 'Reprehenderit est officiis cupiditate quia eos', unit_price: 34355)
        # @item_9 = @merchant_1.items.create!(name: 'Quo Magnam', description: 'Culpa deleniti adipisci voluptates aut. Sed eum quisquam nisi', unit_price: 22582)
        # @item_10 = @merchant_1.items.create!(name: 'Quidem Suscipit', description: 'Reiciendis sed aperiam culpa animi laudantium', unit_price: 34018)
  
        @customer_1 = Customer.create!(first_name: 'Joey', last_name: 'Ondricka')
  
        @invoice_1 = @customer_1.invoices.create!(status: 'completed')
        @invoice_2 = @customer_1.invoices.create!(status: 'completed')
        @invoice_3 = @customer_1.invoices.create!(status: 'completed')
        @invoice_4 = @customer_1.invoices.create!(status: 'completed')
        @invoice_5 = @customer_1.invoices.create!(status: 'completed')
        @invoice_6 = @customer_1.invoices.create!(status: 'completed')
        @invoice_7 = @customer_1.invoices.create!(status: 'completed')
  
        @invoice_item_1 = InvoiceItem.create!(invoice_id: @invoice_1.id, item_id: @item_1.id, quantity: 5, unit_price: 50, status: 'packaged')
        @invoice_item_2 = InvoiceItem.create!(invoice_id: @invoice_2.id, item_id: @item_2.id, quantity: 5, unit_price: 100, status: 'packaged')
        @invoice_item_3 = InvoiceItem.create!(invoice_id: @invoice_3.id, item_id: @item_3.id, quantity: 5, unit_price: 42, status: 'packaged')
        @invoice_item_4 = InvoiceItem.create!(invoice_id: @invoice_4.id, item_id: @item_4.id, quantity: 5, unit_price: 66, status: 'packaged')
        @invoice_item_5 = InvoiceItem.create!(invoice_id: @invoice_5.id, item_id: @item_5.id, quantity: 5, unit_price: 300, status: 'packaged')
        @invoice_item_6 = InvoiceItem.create!(invoice_id: @invoice_6.id, item_id: @item_6.id, quantity: 5, unit_price: 40, status: 'packaged')
        @invoice_item_7 = InvoiceItem.create!(invoice_id: @invoice_7.id, item_id: @item_7.id, quantity: 5, unit_price: 999, status: 'packaged')

        @invoice_item_8 = InvoiceItem.create!(invoice_id: @invoice_7.id, item_id: @item_1.id, quantity: 5, unit_price: 100, status: 'packaged')
  
        @transaction_1 = @invoice_1.transactions.create!(credit_card_number: '4654405418249632', credit_card_expiration_date: '04/22/20', result: 'success')
        @transaction_2 = @invoice_2.transactions.create!(credit_card_number: '4654405418249632', credit_card_expiration_date: '04/22/20', result: 'success')
        @transaction_3 = @invoice_3.transactions.create!(credit_card_number: '4654405418249632', credit_card_expiration_date: '04/22/20', result: 'success')
        @transaction_4 = @invoice_4.transactions.create!(credit_card_number: '4654405418249632', credit_card_expiration_date: '04/22/20', result: 'success')
        @transaction_5 = @invoice_5.transactions.create!(credit_card_number: '4654405418249632', credit_card_expiration_date: '04/22/20', result: 'success')
        @transaction_6 = @invoice_6.transactions.create!(credit_card_number: '4654405418249632', credit_card_expiration_date: '04/22/20', result: 'success')
        @transaction_7 = @invoice_7.transactions.create!(credit_card_number: '4654405418249632', credit_card_expiration_date: '04/22/20', result: 'failed')
      end

      it 'lists the date with the most revenue next to the top 5 merchants' do 
        visit admin_merchants_path 

        within("#link_to_merchant_#{@merchant_1.id}") do 
          expect(page).to have_content("Top selling date for #{@merchant_1.name} was ")   
        end
      end
    end
  end
end