class BulkDiscount < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items, through: :merchant

  validates :name, presence: true
  validates :percent_discount, presence: true, numericality:{only_integer: true}
  validates :quantity_threshold, presence: true, numericality:{only_integer: true}
end