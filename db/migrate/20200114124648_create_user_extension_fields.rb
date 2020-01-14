class CreateUserExtensionFields < ActiveRecord::Migration[5.2]
  def change
    create_table :user_extension_fields do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :value

      t.timestamps
    end
  end
end
