class Item < ApplicationRecord
  has_many_attached :images
  has_many :orders

  with_options presence: true do
    validates :images
    validates :name
    validates :description
    validates_inclusion_of :price, in: 1..9_999_999, message: 'は¥1〜9,999,999に設定してください'
  end
end
