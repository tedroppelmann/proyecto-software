class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :titulo
      t.string :descripcion
      t.text :direccion
      t.integer :capacidad
      t.integer :costo

      t.timestamps
    end
  end
end
