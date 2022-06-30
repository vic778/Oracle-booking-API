class AddFavoriteToCar < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :favorite, :boolean, default: false
  end
end
