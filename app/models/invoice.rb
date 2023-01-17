class Invoice < ApplicationRecord
  enum status: { "in progress": 0, "completed": 1, "cancelled": 2}

  belongs_to :customer
  has_many :invoice_items, dependent: :destroy
  has_many :items, through: :invoice_items, dependent: :destroy
  has_many :merchants, through: :items, dependent: :destroy
  has_many :transactions, dependent: :destroy
  has_many :bulk_discounts, through: :merchants

  validates_presence_of :status

  def self.incomplete_invoices 
    where(status: "in progress")
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

  def discounted_revenue_in_dollars
    c = invoice_items
    .joins(:bulk_discounts)
    .where("invoice_items.quantity >= bulk_discounts.quantity_threshold")
    .select("(invoice_items.quantity * invoice_items.unit_price) - (invoice_items.quantity * invoice_items.unit_price * bulk_discounts.percent_discount/100) as math, invoice_items.*, bulk_discounts.*")
    .group("invoice_items.quantity, invoice_items.id, bulk_discounts.id")
    .order("math")
    .limit(invoice_items.count)

    total = c.sum do |revenue|
      revenue.math
    end

    total/100.to_f.round(2)
  end
end