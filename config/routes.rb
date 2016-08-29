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
  match '/listarCidade', to: 'cidades#get_cities', via: 'get'
  match '/buscaCliente', to: 'pessoas#busca_cliente', via: 'get'
  get 'addponto', to: 'pontoclientes#addponto', as: 'addponto'
  get 'resgataponto', to: 'pontoclientes#resgatarponto', as: 'resgatarponto'
  match '/buscaClientePonto', to: 'pontoclientes#busca_cliente', via: 'get'
  match '/addpontocliente', to: 'pontoclientes#add_ponto', via: 'get'
  get 'buscapremio' => 'pontoclientes#buscapremio'
  match '/resgatapremio', to: 'pontoclientes#resgata_premio', via: 'get'
  
end
