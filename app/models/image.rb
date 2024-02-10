class Image < ApplicationRecord
  belongs_to :article, optional: true
  has_one_attached :file
end
