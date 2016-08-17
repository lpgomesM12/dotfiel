class StaticPagesController < ApplicationController

  def home
    if user_signed_in?
      @clientes =  Clienteempresa.where(empresa_id: current_user.empresa_id).count
    end
  end
end
