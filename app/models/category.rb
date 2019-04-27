class Category < ApplicationRecord
  belongs_to :item, optional: true
  has_ancestry
end
