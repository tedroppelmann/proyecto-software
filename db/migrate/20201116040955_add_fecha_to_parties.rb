class AddFechaToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :fecha, :date
  end
end
