class Article < ApplicationRecord
  include PgSearch::Model
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_rich_text :body
  has_many :images, as: :imageable
  has_one :cover_image, -> { where(cover: true) }, class_name: 'CoverImage', as: :imageable

  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :cover_image, allow_destroy: true

  validates_associated :cover_image
  validates :title, presence: true
  validates :body, presence: true
  validates :summary, presence: true

  before_save :generate_slug

  pg_search_scope :search_for,
                  against: %i[title],
                  ignoring: :accents,
                  using: {
                    tsearch: {},
                    trigram: {
                      threshold: 0.1
                    }
                  }

  private

  def generate_slug
    slug = title.downcase.gsub(/[^a-z0-9]+/, '-').gsub(/^-+|-+$/, '')
    hash = Digest::MD5.hexdigest(title)[0..10]
    slug = "#{slug}-#{hash}"
  end
end
