class InvoiceItem < ApplicationRecord
  enum status: {"pending": 0, "packaged": 1, "shipped": 2}

  belongs_to :item
  belongs_to :invoice

  validates_presence_of :quantity, :unit_price, :status

  def unit_price_in_dollars
    unit_price/100.to_f
  end

  def item_name
    Item.find(self.item_id).name
  end
end