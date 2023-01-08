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

  def total_revenue
    invoice_items.sum('unit_price * quantity')
  end

  def revenue_for_invoice_item(merchant)
#  require 'pry'; binding.pry
  end
end