class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true, optional: true
  has_one_attached :file
end
