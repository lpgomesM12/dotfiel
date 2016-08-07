class CreateRegrapontos < ActiveRecord::Migration
  def change
    create_table :regrapontos do |t|
      t.string :nome_regra

      t.timestamps null: false
    end
  end
end
