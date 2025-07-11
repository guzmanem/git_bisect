class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :city
      t.integer :role
      t.boolean :active

      t.timestamps
    end
  end
end
