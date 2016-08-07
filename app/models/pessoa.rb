class Pessoa < ActiveRecord::Base
  belongs_to :endereco, dependent: :destroy
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"

  accepts_nested_attributes_for :endereco, allow_destroy: true

  SEXO = %w[Masculino Feminino]

  before_create  :geraCodigo
  after_create   :atualizaContador

  def  geraCodigo
  @@contcliente = Contcodigocliente.find(1)
  @@codigo = @@contcliente.codigo
  @@codigo += 1
  self.codigo_cliente  = @@codigo

 end

 def  atualizaContador
    @@contcliente.update(:codigo => @@codigo)
 end

end
