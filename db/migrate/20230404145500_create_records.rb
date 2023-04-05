class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.references :book, null: false, foreign_key: true
      t.integer :done_up_to, default: 0, null: false
      t.float :rating
      t.boolean :finished, default: false, null: false
      t.string :category, null: false
      t.string :headline
      t.text :content

      t.timestamps
    end
  end
end
