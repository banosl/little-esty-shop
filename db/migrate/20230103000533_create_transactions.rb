class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :invoice, foreign_key: true
      t.string :credit_card_number
      t.string :credit_card_expiration_date
      t.string :result
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
