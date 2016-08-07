class CreateContcodigoclientes < ActiveRecord::Migration
  def change
    create_table :contcodigoclientes do |t|
      t.integer :codigo, :limit => 8

      t.timestamps null: false
    end

    Contcodigocliente.create(:codigo => 1000000000)
  end
end
