class Image < ApplicationRecord
  belongs_to :item
  mount_uploaders :file, ImagesUploader
  serialize :file, JSON

  validates :file, presence: true
end
