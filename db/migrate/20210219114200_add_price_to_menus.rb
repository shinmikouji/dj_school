class AddPriceToMenus < ActiveRecord::Migration[6.1]
  def change
    add_column :menus, :price, :integer
  end
end
