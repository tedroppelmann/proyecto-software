Rails.application.routes.draw do
  #get 'comunas/index'
  #get 'comunas/show'
  #get 'comunas/edit'

  # CREATE COMUNA
  get "comunas/new", to: "comunas#new" #--> 'controlador#accion'
  post "comunas", to: "comunas#create"

  #READ COMUNA
  get "comunas/index", to: "comunas#index"
  get "comunas/:id", to: "comunas#show", as: "comuna"

  #UPDATE
  get "comunas/:id/edit", to: "comunas#edit", as: "comuna_edit"
  patch "comunas/:id", to: "comunas#update", as: "comuna_update"

  #DELET
  delete "comunas/:id", to: "comunas#delete"


  get "static_pages/home", to: "static_pages#home"
end
