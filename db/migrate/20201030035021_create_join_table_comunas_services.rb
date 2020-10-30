class CreateJoinTableComunasServices < ActiveRecord::Migration[5.2]
  def change
    create_join_table :comunas, :services do |t|
      # t.index [:comuna_id, :service_id]
      # t.index [:service_id, :comuna_id]
    end
  end
end
