class CreateOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :options do |t|
      t.bigint  :page_id, null: false
      t.string :name, null: false
      t.boolean :correct, default: true, null: false
      t.timestamps
    end
    add_foreign_key :options, :pages
  end
end
