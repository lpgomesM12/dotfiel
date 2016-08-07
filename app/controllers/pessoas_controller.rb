class PessoasController < ApplicationController
  before_action :set_pessoa, only: [:show, :edit, :update, :destroy]

 def busca_cliente
   @pessoa = Pessoa.where(cpf: params[:cpf])
   json_pessoa = @pessoa.map { |item| {:id => item.id,
                                         :nome_primeiro => item.nome_primeiro,
                                         :nome_sobrenome =>  item.nome_sobrenome,
                                         :cpf => item.cpf,
                                         :data_nascimento => item.data_nascimento,
                                         :email => item.email,
                                         :codigo_cliente => item.codigo_cliente,
                                         :sexo => item.sexo,
                                         :endereco => item.endereco.endereco,
                                         :complemento => item.endereco.complemento,
                                         :estado => item.endereco.cidade.estado.nome_estado,
                                         :cidade => item.endereco.cidade.nome_cidade}}
   render :json => json_pessoa
 end
  # GET /pessoas
  # GET /pessoas.json
  def index
    @cliente = Clienteempresa.where(empresa_id: current_user.empresa_id)
  end

  # GET /pessoas/1
  # GET /pessoas/1.json
  def show
  end

  # GET /pessoas/new
  def new
    @pessoa = Pessoa.new
    @pessoa.build_endereco
  end

  # GET /pessoas/1/edit
  def edit
  end

  # POST /pessoas
  # POST /pessoas.json
  def create

    if params[:cliente_id] == ""

       @pessoa = Pessoa.new(pessoa_params)
      if params[:senha] == ""
         @password = SecureRandom.random_number(99999999)
       else
         @password = params[:senha]
      end

      @user = User.new
      @user.email = @pessoa.email
      @user.password = @password
      @user.password_confirmation = @password
      if current_user.id == 1
       @user.empresa_id = current_user.empresa_id
       @user.role = "ADM"
      else
       @user.empresa_id = 1
       @user.role = "USER"
      end

        respond_to do |format|
          if @pessoa.save
            #criando usuário
            @user.pessoa_id = @pessoa.id
            @user.save
            #relacionando usuário com empresa
            Clienteempresa.create(:empresa_id => current_user.empresa_id, :pessoa_id => @pessoa.id)
            format.html { redirect_to @pessoa, notice: 'Cadastro realizado com sucesso!.' }
            format.json { render :show, status: :created, location: @pessoa }
          else
            format.html { render :new }
            format.json { render json: @pessoa.errors, status: :unprocessable_entity }
          end
        end
   else
        Clienteempresa.create(:empresa_id => current_user.empresa_id, :pessoa_id => params[:cliente_id])
        respond_to do |format|
          format.html { redirect_to pessoas_url, notice: 'Cadastro realizado com sucesso!' }
          format.json { head :no_content }
        end
   end

  end

  # PATCH/PUT /pessoas/1
  # PATCH/PUT /pessoas/1.json
  def update
    respond_to do |format|
      if @pessoa.update(pessoa_params)
        format.html { redirect_to @pessoa, notice: 'Cadastro alterado com sucesso!.' }
        format.json { render :show, status: :ok, location: @pessoa }
      else
        format.html { render :edit }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pessoas/1
  # DELETE /pessoas/1.json
  def destroy
    @pessoa.destroy
    respond_to do |format|
      format.html { redirect_to pessoas_url, notice: 'Registro deletado com sucesso!.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pessoa
      @pessoa = Pessoa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pessoa_params
      params.require(:pessoa).permit(:nome_primeiro, :nome_sobrenome, :cpf, :data_nascimento, :email, :sexo, :codigo_cliente, endereco_attributes: [:id, :endereco, :complemento, :desc_cep, :cidade_id])
    end
end
