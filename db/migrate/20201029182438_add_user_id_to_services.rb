class AddUserIdToServices < ActiveRecord::Migration[5.2]
  def change
    add_reference :services, :user, foreign_key: true
  end
end