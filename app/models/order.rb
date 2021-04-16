class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user_info, optional: true
  has_one :post_info

end
