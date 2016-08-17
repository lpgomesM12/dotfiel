class CreatePremios < ActiveRecord::Migration
  def change
    create_table :premios do |t|
      t.string :nome_premio
      t.integer :numr_ponto
      t.string :desc_premio
      t.references :empresa, index: true, foreign_key: true
      t.integer :user_inclusao, :integer, :references => :User, index: true
      t.integer :user_exclusao, :integer, :references => :User, index: true

      t.timestamps null: false
    end
  end
end
