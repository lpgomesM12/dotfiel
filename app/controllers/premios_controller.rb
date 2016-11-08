class PremiosController < ApplicationController
  before_action :set_premio, only: [:show, :edit, :update, :destroy]

  # GET /premios
  # GET /premios.json
  def index

    if params[:empresa_id] != nil
        @empresa = params[:empresa_id]
      else
        @empresa = current_user.empresa_id
    end
    @premios = Premio.where(empresa_id: @empresa)
  end

  # GET /premios/1
  # GET /premios/1.json
  def show
  end

  # GET /premios/new
  def new
    @premio = Premio.new
  end

  # GET /premios/1/edit
  def edit
  end

  # POST /premios
  # POST /premios.json
  def create
    @premio = Premio.new(premio_params)

    respond_to do |format|
      if @premio.save
        format.html { redirect_to @premio, notice: 'Prêmio cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @premio }
      else
        format.html { render :new }
        format.json { render json: @premio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /premios/1
  # PATCH/PUT /premios/1.json
  def update
    respond_to do |format|
      if @premio.update(premio_params)
        format.html { redirect_to @premio, notice: 'Premio was successfully updated.' }
        format.json { render :show, status: :ok, location: @premio }
      else
        format.html { render :edit }
        format.json { render json: @premio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /premios/1
  # DELETE /premios/1.json
  def destroy
    @premio.destroy
    respond_to do |format|
      format.html { redirect_to premios_url, notice: 'Premio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_premio
      @premio = Premio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def premio_params
      params.require(:premio).permit(:nome_premio, :numr_ponto, :desc_premio, :empresa_id, :user_inclusao)
    end
end
