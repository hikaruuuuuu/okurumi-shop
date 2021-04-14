class Order < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :user, optional: true
  belongs_to :user_info
  has_one :post_info
end
