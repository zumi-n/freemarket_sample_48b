class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one :delivery
  has_many :comments
  has_many :images
end
