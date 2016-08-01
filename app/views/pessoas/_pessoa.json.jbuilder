json.extract! pessoa, :id, :nome_primeiro, :nome_sobrenome, :cpf, :endereco_id, :data_nascimento, :email, :sexo, :codigo_cliente, :created_at, :updated_at
json.url pessoa_url(pessoa, format: :json)