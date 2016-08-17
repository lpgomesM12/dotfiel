class Addcolummdados < ActiveRecord::Migration
  def change
       #Enderco
       Endereco.create(:endereco => 'DotGet', :cidade_id => 977)
       #Empresa
       Empresa.create(:nome_empresa => 'DotGet', :endereco_id => 1)
       #Cadastro de pessoas
       Pessoa.create(:nome_primeiro => 'Dotget' , :nome_sobrenome=>"Equipe", :endereco_id => 1)
       #criando usuário
       User.create(:pessoa_id => 1, :email => "equipedotget@gmail.com", :password => "dotgetpro", :password_confirmation => "dotgetpro", :pessoa_id => 1, :role => "ADMINDOTGET")
  end
end
