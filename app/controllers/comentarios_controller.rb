# frozen_string_literal: true

class ComentariosController < ApplicationController
  def index
    @comentarios = Comentario.all
  end

  def new
    @comentario = Comentario.new
  end

  def create
    # tiempo = DateTime.now
    # fecha = current_time.strftime "%d/%m/%Y %H:%M"
    @comentarios_params = params.require(:comentario).permit(:contenido)
    @comentario = Comentario.create(@comentarios_params)

    if @comentario.save
      redirect_to comentarios_new_path, notice: 'agregaste un comentario'
    # esto sirve en vez de poner el path /comunas/new, pasaber usamos rails routes
    else
      redirect_to comentarios_new_path, notice: 'error al agregar un comentario'
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
