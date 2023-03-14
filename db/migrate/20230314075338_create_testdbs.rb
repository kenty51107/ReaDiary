class CreateTestdbs < ActiveRecord::Migration[7.0]
  def change
    create_table :testdbs do |t|

      t.string :test

      t.timestamps
    end
  end
end
