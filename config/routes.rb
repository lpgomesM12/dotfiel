Rails.application.routes.draw do
  get 'loja/index'

  resources :premios
  get 'site/index'

  resources :pontoclientes
  resources :regrapontos
  resources :pessoas
  devise_for :users
  resources :empresas
  resources :enderecos
  resources :cidades
  resources :estados
  get 'static_pages/home'
  root 'static_pages#home'
  get 'addponto', to: 'pontoclientes#addponto', as: 'addponto'
  get 'resgataponto', to: 'pontoclientes#resgatarponto', as: 'resgatarponto'
  get 'buscapremio' => 'pontoclientes#buscapremio'

  match '/listarCidade', to: 'cidades#get_cities', via: 'get'
  match '/buscaCliente', to: 'pessoas#busca_cliente', via: 'get'
  match '/buscaClientePonto', to: 'pontoclientes#busca_cliente', via: 'get'
  match '/addpontocliente', to: 'pontoclientes#add_ponto', via: 'get'
  match '/resgatapremio', to: 'pontoclientes#resgata_premio', via: 'get'
  match '/logar', to: 'userapp#login', via: 'get'
  match '/cadastrarCliente', to: 'userapp#cadastrar_cliente', via: 'get'
  
end
