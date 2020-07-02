class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.bigint     :user_id, foreign_key: :true
      t.bigint     :category_id, null: false, foreign_key: :true
      t.string     :title, null: false
      t.integer    :price
      t.integer    :format, default: 0, null: false, limit: 1
      t.integer    :time_limit
      t.boolean    :public, default: false, null: false
      t.timestamps
    end
  end
end
