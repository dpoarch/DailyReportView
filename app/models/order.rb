class Order < ApplicationRecord
  belongs_to :order_status

  scope :sales_for_a_given_day, ->(order_date) { where(created_at: order_date.beginning_of_day()..order_date.end_of_day()) }

end
