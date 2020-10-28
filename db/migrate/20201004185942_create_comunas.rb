# frozen_string_literal: true

class CreateComunas < ActiveRecord::Migration[5.2]
  def change
    create_table :comunas do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
