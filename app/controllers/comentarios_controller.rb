# frozen_string_literal: true

class ComentariosController < ApplicationController
  def index
    @comentarios = Comentario.all
  end

  def new
    @comentario = Comentario.new(service_id: params[:service_id])
    @service = Service.find(params[:service_id])

    @services = Service.all
    @lista = []
    @services.each do |service|
      @lista.append(service.id)
    end
  end

  def create
    # tiempo = DateTime.now
    # fecha = current_time.strftime "%d/%m/%Y %H:%M"
    @comentarios_params = params.require(:comentario).permit(:contenido, :user_id, :service_id)
    @comentario = Comentario.create(@comentarios_params)

    if @comentario.save
      redirect_to service_path(@comentario.service_id)
    # esto sirve en vez de poner el path /comunas/new, pasaber usamos rails routes
    else
      redirect_to comentarios_new_path(service_id: @comentario.service_id)
    end
  end

  def show
    @comentario = Comentario.find(params[:id])
  end

  def edit
    @comentario = Comentario.find(params[:id])
  end

  def update
    @comentario = Comentario.find(params[:id])
    @comentarios_param = params.require(:comentario).permit(:contenido)

    if @comentario.update(@comentarios_param)
      redirect_to comentario_path(@comentario.id), notice: 'Comentario editada con exito'
    else
      redirect_to comentario_path(@comentario.id), notice: 'Error al editar comentario rey'
    end
  end

  def delete
    @comentario = Comentario.find(params[:id])
    @comentario.destroy
    redirect_to comentarios_index_path
  end
end
