class ChangeColumnToRecords < ActiveRecord::Migration[7.0]
  def change
    change_column :records, :rating, :integer
    remove_column :records, :finished
    add_column :records, :status, :integer, default: 0, null: false
  end
end
