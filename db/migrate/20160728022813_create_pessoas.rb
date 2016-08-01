class CreatePessoas < ActiveRecord::Migration
  def change
    create_table :pessoas do |t|
      t.string :nome_primeiro
      t.string :nome_sobrenome
      t.string :cpf
      t.references :endereco, index: true, foreign_key: true
      t.date :data_nascimento
      t.string :email
      t.string :sexo
      t.integer :codigo_cliente, :limit => 8
      t.integer :user_inclusao, :integer, :references => :User, index: true

      t.timestamps null: false
    end
  end
end
