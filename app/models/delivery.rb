class Delivery < ApplicationRecord
  belongs_to :item
  validates :payer, presence: true
  validates :method, presence: true
  validates :area, presence: true
  validates :date, presence: true

end
