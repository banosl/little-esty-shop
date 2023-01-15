class BulkDiscount < ApplicationRecord
  belongs_to :merchant

  validates_presence_of :name
  validates_presence_of :percent_discount
  validates_presence_of :quantity_threshold
end