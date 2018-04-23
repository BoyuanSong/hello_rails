class CreateVisitors < ActiveRecord::Migration[5.1]
  def change
    create_table :visitors do |t|
      t.string :account
      t.string :pw
      t.string :name
      t.string :email
      t.boolean :isVerify, default: false

      t.timestamps
    end
  end
end
