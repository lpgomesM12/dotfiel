Rails.application.routes.draw do
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
end
