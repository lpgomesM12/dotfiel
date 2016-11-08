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
                       :sobrenome => resource.pessoa.nome_sobrenome,
                       :empresa_id => resource.empresa_id,
                       :role => resource.role,
                       :codigo_cliente => resource.pessoa.codigo_cliente,
                       :pessoa_id => resource.pessoa_id}
      render :json => json_resource
    else
      render :json => false
    end
  end

def cadastrar_cliente
    #debugger
 if params[:cliente_id] == nil
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
  end

    @fiel = Clienteempresa.where(:empresa_id => params[:empresa_id], :pessoa_id => params[:cliente_id])

   if @fiel.empty?
     Clienteempresa.create(:empresa_id => params[:empresa_id], :pessoa_id => params[:cliente_id])
   end
   render :json => true
  end

  def cadastrar_user
    @endereco = Endereco.new
    @endereco.cidade_id = 977
    @endereco.save

    @pessoa = Pessoa.new
    @pessoa.nome_primeiro = params[:primeironome]
    @pessoa.nome_sobrenome = params[:segundonome]
    @pessoa.endereco_id = @endereco.id

    @pessoa.save

    @user = User.new
    @user.email = params[:email]
    @user.password = params[:password]
    @user.password_confirmation = params[:password]
    @user.role = "USER"
    @user.pessoa_id = @pessoa.id
    @user.save

    render :json => true

  end

  def fideliza_cliente

    @clienteempresa = Clienteempresa.new
    @clienteempresa.empresa_id = params[:empresa_id]
    @clienteempresa.pessoa_id = params[:pessoa_id]

    if @clienteempresa.save
      render :json => true
    end

  end
end
