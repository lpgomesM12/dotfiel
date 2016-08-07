class PontoclientesController < ApplicationController
  before_action :set_pontocliente, only: [:show, :edit, :update, :destroy]



  def addponto

  end

  def busca_cliente
     clientes = Clienteempresa.busca_cliente(params[:identificador], current_user.empresa_id)

     @qdtPonto = Pontocliente.where(clienteempresa_id: clientes.first.id).sum(:numr_ponto)

    cliente_json = clientes.map { |item| {:id => item.id,
                                         :nome => item.pessoa.nome_primeiro,
                                         :sobrenome => item.pessoa.nome_sobrenome,
                                         :cpf => item.pessoa.cpf,
                                         :codigo => item.pessoa.codigo_cliente,
                                         :qdtPonto => @qdtPonto}}
    render :json => cliente_json
  end

  # GET /pontoclientes
  # GET /pontoclientes.json
  def index
    @pontoclientes = Pontocliente.all
  end

  # GET /pontoclientes/1
  # GET /pontoclientes/1.json
  def show
  end

  # GET /pontoclientes/new
  def new
    @pontocliente = Pontocliente.new
  end

  # GET /pontoclientes/1/edit
  def edit
  end

  # POST /pontoclientes
  # POST /pontoclientes.json
  def create
    @pontocliente = Pontocliente.new(pontocliente_params)

    respond_to do |format|
      if @pontocliente.save
        format.html { redirect_to @pontocliente, notice: 'Registro incluído com suecsso.' }
        format.json { render :show, status: :created, location: @pontocliente }
      else
        format.html { render :new }
        format.json { render json: @pontocliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pontoclientes/1
  # PATCH/PUT /pontoclientes/1.json
  def update
    respond_to do |format|
      if @pontocliente.update(pontocliente_params)
        format.html { redirect_to @pontocliente, notice: 'Pontocliente was successfully updated.' }
        format.json { render :show, status: :ok, location: @pontocliente }
      else
        format.html { render :edit }
        format.json { render json: @pontocliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pontoclientes/1
  # DELETE /pontoclientes/1.json
  def destroy
    @pontocliente.destroy
    respond_to do |format|
      format.html { redirect_to pontoclientes_url, notice: 'Pontocliente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pontocliente
      @pontocliente = Pontocliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pontocliente_params
      params.require(:pontocliente).permit(:numr_ponto, :valor_gasto, :desc_ponto, :flag_resgatado, :empresa_id, :clienteempresa_id, :regraponto_id, :desc_ponto, :flag_resgatado, :user_inclusao)
    end
end
