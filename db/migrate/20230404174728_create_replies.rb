class CreateReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :replies do |t|
      t.references :record, null: false, foreign_key: true
      t.integer :responder_id, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
