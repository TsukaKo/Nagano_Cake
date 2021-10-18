class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.integer :id
      t.string :email
      t.string :encrypted_password
      t.datetime :created_at
      t.tatetime :updated_at
      t.timestamps
    end
  end
end
