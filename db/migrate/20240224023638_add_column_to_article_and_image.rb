class AddColumnToArticleAndImage < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :summary, :string
    add_column :images, :cover, :boolean, default: false
  end
end

