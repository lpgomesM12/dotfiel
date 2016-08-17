class RegrapontosController < ApplicationController
  before_action :set_regraponto, only: [:show, :edit, :update, :destroy]


  # GET /regrapontos
  # GET /regrapontos.json
  def index
    @regrapontos = Regraponto.all
  end

  # GET /regrapontos/1
  # GET /regrapontos/1.json
  def show
  end

  # GET /regrapontos/new
  def new
    @regraponto = Regraponto.new
  end

  # GET /regrapontos/1/edit
  def edit
  end

  # POST /regrapontos
  # POST /regrapontos.json
  def create
    @regraponto = Regraponto.new(regraponto_params)

    respond_to do |format|
      if @regraponto.save
        format.html { redirect_to @regraponto, notice: 'Regraponto was successfully created.' }
        format.json { render :show, status: :created, location: @regraponto }
      else
        format.html { render :new }
        format.json { render json: @regraponto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /regrapontos/1
  # PATCH/PUT /regrapontos/1.json
  def update
    respond_to do |format|
      if @regraponto.update(regraponto_params)
        format.html { redirect_to @regraponto, notice: 'Regraponto was successfully updated.' }
        format.json { render :show, status: :ok, location: @regraponto }
      else
        format.html { render :edit }
        format.json { render json: @regraponto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regrapontos/1
  # DELETE /regrapontos/1.json
  def destroy
    @regraponto.destroy
    respond_to do |format|
      format.html { redirect_to regrapontos_url, notice: 'Regraponto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_regraponto
      @regraponto = Regraponto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def regraponto_params
      params.require(:regraponto).permit(:nome_regra)
    end
end
