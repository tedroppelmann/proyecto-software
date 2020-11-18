class AddMonederoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :monedero, :integer
  end
end
