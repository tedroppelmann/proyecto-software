class AddServiceIdToComentarios < ActiveRecord::Migration[5.2]
  def change
    add_reference :comentarios, :service, foreign_key: true
  end
end
