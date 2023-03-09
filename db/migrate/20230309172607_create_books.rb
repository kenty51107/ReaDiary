class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.string :author, null: false
      t.date :published_date
      t.string :publisher
      t.text :description
      t.string :thumbnail
      t.integer :page_count
      t.string :isbn_10, null: false
      t.string :isbn_13, null: false

      t.timestamps
    end
    add_index :books, :isbn_10, unique: true
    add_index :books, :isbn_13, unique: true
    add_index :books, [:isbn_10, :isbn_13], unique: true 
  end
end
