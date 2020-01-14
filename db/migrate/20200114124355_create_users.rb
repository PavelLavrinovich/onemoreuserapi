class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :phone
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
