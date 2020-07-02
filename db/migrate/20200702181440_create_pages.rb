class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.bigint :article_id
      t.text :text, null: false
      t.timestamps
    end
    add_foreign_key :pages, :articles
  end
end
