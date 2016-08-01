class CreateClienteempresas < ActiveRecord::Migration
  def change
    create_table :clienteempresas do |t|
      t.references :empresa, index: true, foreign_key: true
      t.references :pessoa, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
