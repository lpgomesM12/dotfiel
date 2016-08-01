class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :nome_empresa
      t.string :cnpj
      t.string :nome_responsavel
      t.string :desc_telefone
      t.references :endereco, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
