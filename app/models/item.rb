class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one :delivery, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :delibery, allow_destroy: true
end
