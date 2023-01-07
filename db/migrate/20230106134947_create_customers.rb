class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :username,           null: false
      t.string :email,              null: false
      t.string :password_digest,    null: false
      t.string :confirmation_token         
      t.integer :phone_number      
      t.string :confirmed_at          #used  for token
      t.datetime :confirmation_sent_at
      
      t.timestamps
    end
  end
end
