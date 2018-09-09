class Contract < ApplicationRecord
  belongs_to :requested_order, class_name: 'Order', foreign_key: :requested_order_id
  belongs_to :responded_order, class_name: 'Order', foreign_key: :responded_order_id
end
