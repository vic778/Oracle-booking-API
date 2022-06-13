class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :title
      t.text :description
      t.string :model
      t.float :price
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
