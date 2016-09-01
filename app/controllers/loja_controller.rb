class LojaController < ApplicationController

  layout "loja"
  def index
    @premios = Premio.where(empresa_id: params[:empresa])
    @empresa = Empresa.find(params[:empresa])
  end
end
