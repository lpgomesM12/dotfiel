class Pontocliente < ActiveRecord::Base
  belongs_to :empresa
  belongs_to :clienteempresa
  belongs_to :regraponto
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"
end
