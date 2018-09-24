class UpdateTableToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :code, :string
    remove_column :products, :quantity
    change_column :products, :availability, :string
  end
end
