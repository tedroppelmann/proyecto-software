class AddValoracionToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :valoracion, :integer, default: 0
  end
end
