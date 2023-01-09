
class Merchant < ApplicationRecord

  enum status: { disabled: 0, enabled: 1 }

  has_many :items, dependent: :destroy
  has_many :invoice_items, through: :items, dependent: :destroy
  has_many :invoices, through: :invoice_items, dependent: :destroy
  has_many :customers, through: :invoices, dependent: :destroy
  has_many :transactions, through: :invoices, dependent: :destroy

  def self.find_by_status(merchant_status) 
    Merchant.where(status: merchant_status).order(updated_at: :desc)
  end

  # def has_invoice_with_succesful_transaction? 
  #   binding.pry
  # end

  # def total_revenue
  #   binding.pry
  # end

  def unshipped_items 
    items.select(
          'items.*,
           invoice_items.invoice_id as invoice_id,
           invoices.created_at as invoice_created_at'
        )
       .joins(invoice_items: :invoice)
       .where(invoices: {status: 0})
       .where.not(invoice_items: {status: 2})    
  end

  def top_5_items_by_revenue
    items
      .joins(:invoices, :transactions)
      .where(transactions: { result: 'success'})
      .select('items.*, sum(invoice_items.quantity * invoice_items.unit_price) as revenue')
      .group(:id)
      .order(revenue: :desc)
      .limit(5)
  end

  def self.top_5_merchants_by_revenue 
    joins(:invoices, :transactions)
    .where(transactions: {result: "success"})
    .select("merchants.*, merchants.name as merchant_name, sum(invoice_items.quantity * invoice_items.unit_price) as revenue")
    .group(:id)
    .order(revenue: :desc)
    .limit(5).to_a
  end

  def top_selling_date 
    invoices
      .select('invoices.*, sum(invoice_items.quantity * invoice_items.unit_price) as revenue')
      .group(:id)
      .order(revenue: :desc)
      .first
      .created_at
  end
end