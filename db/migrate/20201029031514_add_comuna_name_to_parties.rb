class AddComunaNameToParties < ActiveRecord::Migration[5.2]
  def change
    add_reference :parties, :comuna, foreign_key: true
  end
end
