class AddCodeToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :code, :string
  end
end
