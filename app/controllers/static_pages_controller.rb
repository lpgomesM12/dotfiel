class StaticPagesController < ApplicationController

  def home
    if user_signed_in?
      @clientes =  Clienteempresa.where(empresa_id: current_user.empresa_id).count
      @premios = Premio.where(empresa_id: current_user.empresa_id).count

      @pontosclientes = Pontocliente.where(empresa_id: current_user.empresa_id)

    end
  end
end
