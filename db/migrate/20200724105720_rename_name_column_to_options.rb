class RenameNameColumnToOptions < ActiveRecord::Migration[5.2]
  def change
    rename_column :options, :name, :answer
  end
end
