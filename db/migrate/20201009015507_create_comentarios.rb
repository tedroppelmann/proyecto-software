# frozen_string_literal: true

class CreateComentarios < ActiveRecord::Migration[5.2]
  def change
    create_table :comentarios do |t|
      t.text :contenido
      t.string :fecha

      t.timestamps
    end
  end
end
