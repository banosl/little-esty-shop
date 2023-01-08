class InvoiceItem < ApplicationRecord
  enum status: {"pending": 0, "packaged": 1, "shipped": 2}

  belongs_to :item
  belongs_to :invoice

  def unit_price_in_dollars
    unit_price/100.to_f
  end
end