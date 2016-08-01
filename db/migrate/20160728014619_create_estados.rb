class CreateEstados < ActiveRecord::Migration
  def change
    create_table :estados do |t|
      t.string :nome_estado
      t.string :sigl_estado
      t.boolean :flag_ativo

      t.timestamps null: false
    end

    Estado.create(:nome_estado => 'Acre', :sigl_estado =>  'AC', :flag_ativo => false)
  	Estado.create(:nome_estado => 'Alagoas', :sigl_estado => 'AL', :flag_ativo => false )
  	Estado.create(:nome_estado => 'Amazonas', :sigl_estado => 'AM', :flag_ativo => false)
  	Estado.create(:nome_estado => 'Amapá', :sigl_estado => 'AP', :flag_ativo => false)
  	Estado.create(:nome_estado => 'Bahia', :sigl_estado => 'BA', :flag_ativo => false)
  	Estado.create(:nome_estado => 'Ceará', :sigl_estado => 'CE', :flag_ativo => false)
  	Estado.create(:nome_estado => 'Distrito Federal', :sigl_estado => 'DF', :flag_ativo => false)
  	Estado.create(:nome_estado => 'Espírito Santo', :sigl_estado => 'ES', :flag_ativo => false)
  	Estado.create(:nome_estado => 'Goiás',:sigl_estado => 'GO', :flag_ativo => false)
  	Estado.create(:nome_estado => 'Maranhão', :sigl_estado => 'MA', :flag_ativo => false)
  	Estado.create(:nome_estado => 'Minas Gerais', :sigl_estado => 'MG', :flag_ativo => false)
  	Estado.create(:nome_estado => 'Mato Grosso do Sul', :sigl_estado => 'MS', :flag_ativo => false)
  	Estado.create(:nome_estado => 'Mato Grosso', :sigl_estado => 'MT', :flag_ativo => false)
  	Estado.create(:nome_estado => 'Pará', :sigl_estado => 'PA', :flag_ativo => false)
  	Estado.create(:nome_estado => 'Paraíba', :sigl_estado => 'PB', :flag_ativo => false)
  	Estado.create(:nome_estado => 'Pernambuco', :sigl_estado => 'PE', :flag_ativo => false)
  	Estado.create(:nome_estado => 'Piauí', :sigl_estado => 'PI', :flag_ativo => false)
  	Estado.create(:nome_estado => 'Paraná', :sigl_estado => 'PR', :flag_ativo => false)
  	Estado.create(:nome_estado => 'Rio de Janeiro', :sigl_estado => 'RJ', :flag_ativo => false)
  	Estado.create(:nome_estado => 'Rio Grande do Norte', :sigl_estado => 'RN', :flag_ativo => false)
  	Estado.create(:nome_estado => 'Rondônia', :sigl_estado => 'RO', :flag_ativo => false)
  	Estado.create(:nome_estado => 'Roraima', :sigl_estado => 'RR', :flag_ativo => false)
  	Estado.create(:nome_estado => 'Rio Grande do Sul', :sigl_estado => 'RS', :flag_ativo => false)
  	Estado.create(:nome_estado => 'Santa Catarina', :sigl_estado => 'SC', :flag_ativo => false)
  	Estado.create(:nome_estado => 'Sergipe', :sigl_estado => 'SE', :flag_ativo => false)
  	Estado.create(:nome_estado => 'São Paulo', :sigl_estado => 'SP', :flag_ativo => false)
  	Estado.create(:nome_estado => 'Tocantins', :sigl_estado => 'TO', :flag_ativo => false )
    
  end
end
