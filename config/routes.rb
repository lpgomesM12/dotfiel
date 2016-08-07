Rails.application.routes.draw do
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
  match '/buscaClientePonto', to: 'pontoclientes#busca_cliente', via: 'get'
  match '/addpontocliente', to: 'regrapontos#add_ponto', via: 'get'
end
