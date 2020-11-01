# frozen_string_literal: true

class ComunasController < ApplicationController
  def index
    @comunas = Comuna.all
  end

  def new
    @comuna = Comuna.new
  end

  def create
    @comunas_params = params.require(:comuna).permit(:nombre)
    @comuna = Comuna.create(@comunas_params)

    if @comuna.save
      redirect_to comunas_index_path
    # esto sirve en vez de poner el path /comunas/new, pasaber usamos rails routes
    else
      redirect_to comunas_new_path, notice: 'error al agregar una comuna'
    end
  end

  def show
    @comuna = Comuna.find(params[:id])
  end

  def edit
    @comuna = Comuna.find(params[:id])
  end

  def update
    @comuna = Comuna.find(params[:id])
    @comunas_params = params.require(:comuna).permit(:nombre)

    if @comuna.update(@comunas_params)
      redirect_to comunas_index_path
    else
      redirect_to comuna_edit_path(@comuna.id), notice: 'error al editar la comuna'
    end
  end

  def delete
    @comuna = Comuna.find(params[:id])
    @comuna.destroy
    redirect_to comunas_index_path
  end
end
