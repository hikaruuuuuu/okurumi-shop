class Item < ApplicationRecord
  has_many_attached :images
  has_many :orders

  with_options presence: true do
    validates :images
    validates :name
    validates :description
    validates :price, numericality: { only_integer: true, in: 1..9_999_999, message: 'は¥300〜9,999,999に設定してください', allow_blank: true }
  end
end
