class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :brand
      t.string :name
      t.string :price
      t.string :image_link
      t.string :product_link

      t.timestamps
    end
  end
end
