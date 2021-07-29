class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :session_token
      t.boolean :isadmin

      t.timestamps
    end

    add_index :users, :name, unique:true
    add_index :users, :email, unique:true
  end
end
