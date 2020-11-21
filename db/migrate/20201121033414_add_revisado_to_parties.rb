class AddRevisadoToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :revisado, :boolean
  end
end
