class AddEmpresaToUser < ActiveRecord::Migration
  def change
    add_reference :users, :empresa, index: true, foreign_key: true
    add_reference :users, :pessoa, index: true, foreign_key: true
  end
end
