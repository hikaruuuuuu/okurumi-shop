class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user, optional: true
  belongs_to :user_info, optional: true
  has_one :post_info

  # with_options presence: true do
  #   validates :item_id
  #   validates :user_id, if: -> { user_info_id.blank? }
  #   validates :user_info_id, if: -> { user_id.blank? }
  # end

  validates :item_id, presence: true
  validates :user_id, presence: true, unless: -> { user_info_id.present? }
  validates :user_info_id, presence: true

end
