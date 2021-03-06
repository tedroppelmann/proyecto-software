# frozen_string_literal: true

Rails.application.routes.draw do
  get 'comentarios/index'
  get 'comentarios/new'
  get 'comentarios/show'
  get 'comentarios/edit'
  get 'services/index'
  get 'services/new'
  get 'services/show'
  get 'services/edit'
  # get 'parties/index'
  # get 'parties/new'
  # get 'parties/show'
  # get 'parties/edit'
  # get 'comunas/index'
  # get 'comunas/show'
  # get 'comunas/edit'

  # CREATE COMUNA
  get 'comunas/new', to: 'comunas#new' #--> 'controlador#accion'
  post 'comunas', to: 'comunas#create'

  # READ COMUNA
  get 'comunas/index', to: 'comunas#index'
  get 'comunas/:id', to: 'comunas#show', as: 'comuna'

  # UPDATE COMUNA
  get 'comunas/:id/edit', to: 'comunas#edit', as: 'comuna_edit'
  patch 'comunas/:id', to: 'comunas#update', as: 'comuna_update'

  # DELETE COMUNA
  delete 'comunas/:id', to: 'comunas#delete'

  # CREATE PARTY
  get 'parties/new', to: 'parties#new'
  post 'parties', to: 'parties#create'

  # READ PARTY
  get 'parties/index', to: 'parties#index'
  get 'parties/:id', to: 'parties#show', as: 'party'

  # UPDATE PARTY
  get 'parties/:id/edit', to: 'parties#edit', as: 'party_edit'
  patch 'parties/:id', to: 'parties#update', as: 'party_update'

  # DELETE PARTY
  delete 'parties/:id', to: 'parties#delete'

  # CREATE SERVICE
  get 'services/new', to: 'services#new' #--> 'controlador#accion'
  post 'services', to: 'services#create'
  # READ SERVICE
  get 'services/index', to: 'services#index'
  get 'services/:id', to: 'services#show', as: 'service'
  # UPDATE SERVICE
  get 'services/:id/edit', to: 'services#edit', as: 'service_edit'
  patch 'services/:id', to: 'services#update', as: 'service_update'
  # DELETE SERVICE
  delete 'services/:id', to: 'services#delete'

  # CREATE COMMENT
  get 'comentarios/new', to: 'comentarios#new'
  post 'comentarios', to: 'comentarios#create'
  # READ COMMENNT
  get 'comentarios/index', to: 'comentarios#index'
  get 'comentarios/:id', to: 'comentarios#show', as: 'comentario'
  # UPDATE COMMENT
  get 'comentarios/:id/edit', to: 'comentarios#edit', as: 'comentario_edit'
  patch 'comentarios/:id', to: 'comentarios#update', as: 'comentario_update'
  # DELETE COMMENT
  delete 'comentarios/:id', to: 'comentarios#delete'

  #apuesta
  get 'parties/:id/bet', to: 'parties#bet', as: 'party_bet'
  post 'parties/:id/bet', to: 'parties#create_bet', as: 'party_create_bet'

  #update_apuesta
  get 'parties/:id/edit_bet', to: 'parties#edit_bet', as: 'party_edit_bet'
  patch 'parties/:id/edit_bet', to: 'parties#update_bet', as: 'party_update_bet'

  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  devise_scope :user do
    get "users/sessions/show", to: "users/sessions#show", as: "user_show_session"
    get "users/sessions/show_monedero", to: "users/sessions#show_monedero", as: "user_show_monedero"
    get "users/sessions/cargar_monedero", to: "users/sessions#cargar_monedero", as: "user_cargar_monedero"
    patch "users/sessions/patch_monedero", to: "users/sessions#patch_monedero", as: "user_patch_monedero"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'static_pages/home', to: 'static_pages#home'
  root to: 'static_pages#home'
end