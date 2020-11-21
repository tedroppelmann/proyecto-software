class AddHacerToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :hacer, :boolean
  end
end
