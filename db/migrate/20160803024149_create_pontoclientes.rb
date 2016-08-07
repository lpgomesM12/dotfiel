class CreatePontoclientes < ActiveRecord::Migration
  def change
    create_table :pontoclientes do |t|
      t.integer :numr_ponto
      t.decimal :valor_gasto
      t.string :desc_ponto
      t.boolean :flag_resgatado
      t.references :empresa, index: true, foreign_key: true
      t.references :clienteempresa, index: true, foreign_key: true
      t.references :regraponto, index: true, foreign_key: true
      t.string :desc_ponto
      t.boolean :flag_resgatado
      t.integer :user_inclusao, :integer, :references => :User, index: true

      t.timestamps null: false
    end
  end
end
