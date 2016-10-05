class UserappController < ApplicationController

  def login
    resource = User.find_for_database_authentication(email: params[:email])

    if resource == nil
      return render :json => false
    end

    if resource.valid_password?(params[:password])
      #user = User.find(resource.id)
      json_resource = {:id => resource.id,
                       :nome =>  resource.pessoa.nome_primeiro,
                       :empresa_id => resource.empresa_id}
      render :json => json_resource
    else
      render :json => false
    end
  end

  def cadastrar_cliente
    #debugger
    @endereco = Endereco.new
    @endereco.endereco = params[:endereco]
    @endereco.cidade_id = params[:cidade_id]
    @endereco.complemento = params[:complemento]

    @endereco.save

    @pessoa = Pessoa.new
    @pessoa.nome_primeiro = params[:primeironome]
    @pessoa.nome_sobrenome = params[:segundonome]
    @pessoa.data_nascimento = params[:dtnascimento]
    @pessoa.cpf = params[:cpf]
    @pessoa.email = params[:email]
    @pessoa.sexo = params[:sexo]
    @pessoa.endereco_id = @endereco.id
    @pessoa.save

    @password = SecureRandom.random_number(99999999)

    @user = User.new
    @user.email = params[:email]
    @user.password = @password
    @user.password_confirmation = @password
    @user.role = "USER"
    @user.pessoa_id = @pessoa.id

    @clienteempresa = Clienteempresa.new
    @clienteempresa.empresa_id = params[:empresa_id]
    @clienteempresa.pessoa_id = @pessoa.id
    @clienteempresa.save

    if @user.save
      @empresa = Empresa.find(params[:empresa_id])
      Userinfo.send_email(@user,@empresa.nome_empresa).deliver
    end

    render :json => true

  end
end
