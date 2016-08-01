class Pessoa < ActiveRecord::Base
  belongs_to :endereco, dependent: :destroy
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"

  accepts_nested_attributes_for :endereco, allow_destroy: true

  SEXO = %w[Masculino Feminino]
end
