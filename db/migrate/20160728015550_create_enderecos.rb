class CreateEnderecos < ActiveRecord::Migration
  def change
    create_table :enderecos do |t|
      t.string :endereco
      t.string :complemento
      t.string :numero
      t.string :cep
      t.references :cidade, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
