class UserInfo < ApplicationRecord
  belongs_to :user, optional: true
  has_many :orders
end
