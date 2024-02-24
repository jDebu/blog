class ChangeImagesToPolymorphic < ActiveRecord::Migration[7.1]
  def change
    remove_reference :images, :article, foreign_key: true
    add_reference :images, :imageable, polymorphic: true, index: true
  end
end
