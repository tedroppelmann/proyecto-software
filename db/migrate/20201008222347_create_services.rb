# frozen_string_literal: true

class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.string :nombre
      t.string :descripcion
      t.integer :cap_max
      t.integer :precio

      t.timestamps
    end
  end
end
