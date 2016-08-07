class Clienteempresa < ActiveRecord::Base
  belongs_to :empresa
  belongs_to :pessoa


  def self.busca_cliente(indent, empresa)
    sql = " INNER JOIN pessoas pe on pessoa_id = pe.id"
    sql = sql + " WHERE empresa_id = #{empresa}"
    sql = sql + " AND (pe.cpf = '#{indent}' OR pe.codigo_cliente = #{indent})"
    self.joins(sql)
  end

end
