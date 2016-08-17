class Userinfo < ApplicationMailer
  default :from => 'equipedotget@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_email(user,nome_empresa)
    @nome_empresa = nome_empresa
    @user = user
    mail( :to => @user.email,
    :subject => 'Bem-vindo ao Programa de Fidelidade ' + @nome_empresa )
  end
end
