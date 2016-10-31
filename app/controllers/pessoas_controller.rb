class PessoasController < ApplicationController
  before_action :set_pessoa, only: [:show, :edit, :update, :destroy]


#Para aplicativo
def show_cliente
     @cliente = Clienteempresa.find(params[:cliente_id])

     @qdtPonto = Pontocliente.where(clienteempresa_id: params[:cliente_id]).sum(:numr_ponto)

     json_cliente =   {:id => @cliente.id,
                            :nome_primeiro => @cliente.pessoa.nome_primeiro,
                            :nome_sobrenome =>  @cliente.pessoa.nome_sobrenome,
                            :cpf => @cliente.pessoa.cpf,
                            :data_nascimento => @cliente.pessoa.data_nascimento.strftime("%d/%m/%Y"),
                            :email => @cliente.pessoa.email,
                            :codigo_cliente => @cliente.pessoa.codigo_cliente,
                            :ponto_acumulado => @qdtPonto,
                            :sexo => @cliente.pessoa.sexo,
                            :endereco => @cliente.pessoa.endereco.endereco,
                            :complemento => @cliente.pessoa.endereco.complemento,
                            :estado => @cliente.pessoa.endereco.cidade.estado.nome_estado,
                            :estado_id => @cliente.pessoa.endereco.cidade.estado_id,
                            :cidade => @cliente.pessoa.endereco.cidade.nome_cidade,
                            :cidade_id => @cliente.pessoa.endereco.cidade_id}

     render :json => json_cliente
end

 def busca_cliente

   if params[:empresa_id] != nil
      @empresa = params[:empresa_id]
    else
      @empresa = current_user.empresa_id
   end

   @pessoa = Pessoa.where(cpf: params[:cpf])
   #quando não tem cadastro
   @situacao = 0

    unless @pessoa.empty?
      #quando encontrou a pessoa no banco de dados
      @situacao = 1
      @clientefiel = Clienteempresa.where(pessoa_id: @pessoa.first.id, empresa_id: @empresa)
    unless @clientefiel.empty?
       #quando encontrou a pessoa no banco de dados e a mesma já é morador do condominio
       @situacao = 2
    end
   end


   json_pessoa = @pessoa.map { |item| {:id => item.id,
                                         :nome_primeiro => item.nome_primeiro,
                                         :nome_sobrenome =>  item.nome_sobrenome,
                                         :cpf => item.cpf,
                                         :data_nascimento =>  item.data_nascimento,
                                         :email => item.email,
                                         :codigo_cliente => item.codigo_cliente,
                                         :sexo => item.sexo,
                                         :endereco => item.endereco.endereco,
                                         :complemento => item.endereco.complemento,
                                         :estado => item.endereco.cidade.estado.nome_estado,
                                         :estado_id => item.endereco.cidade.estado_id,
                                         :cidade => item.endereco.cidade.nome_cidade,
                                         :cidade_id => item.endereco.cidade_id,
                                         :situacao => @situacao}}
   render :json => json_pessoa
 end
  # GET /pessoas
  # GET /pessoas.json
  def index
    @cliente = Clienteempresa.where(empresa_id: current_user.empresa_id)
  end

  def lista_clientes
    @clientes = Clienteempresa.where(empresa_id: params[:empresa_id])

    json_clientes = @clientes.map { |item| {:id => item.id,
                                          :nome_primeiro => item.pessoa.nome_primeiro,
                                          :nome_sobrenome =>  item.pessoa.nome_sobrenome,
                                          :cpf => item.pessoa.cpf,
                                          :data_nascimento => item.pessoa.data_nascimento.strftime("%d/%m/%Y"),
                                          :email => item.pessoa.email,
                                          :codigo_cliente => item.pessoa.codigo_cliente,
                                          :sexo => item.pessoa.sexo,
                                          :endereco => item.pessoa.endereco.endereco,
                                          :complemento => item.pessoa.endereco.complemento,
                                          :estado => item.pessoa.endereco.cidade.estado.nome_estado,
                                          :estado_id => item.pessoa.endereco.cidade.estado_id,
                                          :cidade => item.pessoa.endereco.cidade.nome_cidade,
                                          :cidade_id => item.pessoa.endereco.cidade_id}}

    render :json => json_clientes
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
       #@user.role = "ADMIN"
      else
       @user.empresa_id = 1
       #@user.role = "USER"
      end

       @user.role = "USER"

        respond_to do |format|
          if @pessoa.save
            #criando usuário
            @user.pessoa_id = @pessoa.id
            if @user.save
              Userinfo.send_email(@user,current_user.empresa.nome_empresa).deliver
            end
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
