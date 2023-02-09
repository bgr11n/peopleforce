class CreateUserCustomFields < ActiveRecord::Migration[7.0]
  def change
    create_table :user_custom_fields do |t|
      t.string :type
      t.string :label
      t.string :values, array: true

      t.timestamps

      t.index :label, unique: true
      t.index :type
    end
  end
end
