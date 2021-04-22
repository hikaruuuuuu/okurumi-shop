class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :items, through: :cart_items
  has_many :cart_items
end
