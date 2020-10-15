# frozen_string_literal: true

class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def new
    @service = Service.new
  end

  def create
    @services_param = params.require(:service).permit(:nombre, :descripcion, :cap_max, :precio)
    @service = Service.create(@services_param)

    if @service.save
      redirect_to services_new_path, notice: 'Wow creaste tu service'
    else
      redirect_to services_new_path, notice: 'Error al crear tu service'
    end
  end

  def show
    @service = Service.find(params[:id])
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    @services_param = params.require(:service).permit(:nombre, :descripcion, :cap_max, :precio)

    if @service.update(@services_param)
      redirect_to service_path(@service.id), notice: 'Service editada con exito'
    else
      redirect_to service_path(@service.id), notice: 'Error al editar servicio rey'
    end
  end

  def delete
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to services_index_path
  end
end
