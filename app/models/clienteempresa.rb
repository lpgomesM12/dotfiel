class Clienteempresa < ActiveRecord::Base
  belongs_to :empresa
  belongs_to :pessoa
end
