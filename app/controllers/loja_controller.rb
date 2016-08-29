class LojaController < ApplicationController

  layout "loja"
  def index
    @premios = Premio.all
  end
end
