class RemoveFechaFromComentarios < ActiveRecord::Migration[5.2]
  def change
    remove_column :comentarios, :fecha, :string
  end
end
