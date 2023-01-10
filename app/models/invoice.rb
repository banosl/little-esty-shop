class Invoice < ApplicationRecord
  enum status: { "in progress": 0, "completed": 1, "cancelled": 2}

  belongs_to :customer
  has_many :invoice_items, dependent: :destroy
  has_many :items, through: :invoice_items, dependent: :destroy
  has_many :merchants, through: :items, dependent: :destroy
  has_many :transactions, dependent: :destroy

  def self.incomplete_invoices 
    where(status: "in progress")
  end

  def self.complete_invoices 
    where(status: "complete")
  end

  def contains_successful_transaction?
    transactions.where(result: "success").count > 0
  end

  def total_revenue
    invoice_items.sum('unit_price * quantity')
  end

  def total_revenue_in_dollars
    total_revenue/100.to_f
  end
end