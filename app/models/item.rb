class Item < ApplicationRecord
  has_many_attached :images
  has_many :orders

  with_options presence: true do
    validates :images
    validates :name
    validates :description
    validates :price
  end
end
