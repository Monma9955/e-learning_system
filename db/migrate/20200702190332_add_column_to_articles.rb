class AddColumnToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :category_id, :bigint
    add_foreign_key :articles, :categories
  end
end
