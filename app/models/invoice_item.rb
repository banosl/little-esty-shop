class InvoiceItem < ApplicationRecord
  enum status: {"pending": 0, "packaged": 1, "shipped": 2}

  belongs_to :item
  belongs_to :invoice
  has_many :merchants, through: :invoice
  has_many :bulk_discounts, through: :merchants

  validates_presence_of :quantity, :unit_price, :status

  def unit_price_in_dollars
    unit_price/100.to_f
  end

  def item_name
    Item.find(self.item_id).name
  end

  def discount_applied
    discount = bulk_discounts
    .where("? >= bulk_discounts.quantity_threshold", quantity)
    .select("(invoice_items.quantity * invoice_items.unit_price) - (invoice_items.quantity * invoice_items.unit_price * bulk_discounts.percent_discount/100) as math, invoice_items.*, bulk_discounts.*, bulk_discounts.name as discount")
    .order("math")
    .where(invoice_items:{quantity: quantity})
    .first

    if discount != nil
      discount.name
    end
  end
end