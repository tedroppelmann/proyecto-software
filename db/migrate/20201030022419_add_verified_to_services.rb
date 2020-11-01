class AddVerifiedToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :verified, :boolean, default: false
  end
end
