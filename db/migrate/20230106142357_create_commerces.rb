class CreateCommerces < ActiveRecord::Migration[7.0]
  def change
    create_table :commerces do |t|
      t.string :color
      t.string :department
      t.string :price
      t.string :promotion_code
      t.string :material
      t.string :brand
      t.string :vendor

      t.timestamps
    end
  end
end
