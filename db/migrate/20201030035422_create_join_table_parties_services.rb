class CreateJoinTablePartiesServices < ActiveRecord::Migration[5.2]
  def change
    create_join_table :parties, :services do |t|
      # t.index [:party_id, :service_id]
      # t.index [:service_id, :party_id]
    end
  end
end
