# frozen_string_literal: true

class PartiesController < ApplicationController
  def index
    @parties = Party.all
  end

  def new
    @party = Party.new
    @comunas = Comuna.all
    @service_all = Service.all
    @lista = []
    @comunas.each do |comuna|
      @lista.append(comuna.id)
    end
  end

  def create
    @parties_param = params.require(:party).permit(:titulo, :descripcion, :fecha, :direccion, :capacidad, :costo, :user_id, :comuna_id, :code, { service_ids: [] })
    @party = Party.create(@parties_param)

    if @party.save
      redirect_to parties_index_path
    else
      redirect_to parties_new_path, notice: 'Error al crear tu party'
    end
  end

  def show
    @party = Party.find(params[:id])
    @usuarios = User.all
    @todos_los_asistentes = Assistant.all
    @mis_asistentes = []

    @todos_los_asistentes.each do |relacion|
      next unless relacion.party_id == @party.id

      @usuarios.each do |persona|
        if relacion.user_id == persona.id
          agregar = [persona.email, relacion.bet]
          @mis_asistentes.append(agregar)
        end
      end
    end

    @recaudado = Assistant.where("party_id = ?", @party.id).sum('bet')
    
  end

  def edit
    @party = Party.find(params[:id])
  end

  def update
    @party = Party.find(params[:id])
    @parties_param = params.require(:party).permit(:titulo, :descripcion, :fecha, :direccion, :capacidad, :costo, :user_id, :comuna_id, :code, { service_ids: [] })

    if @party.update(@parties_param)
      redirect_to parties_index_path
    else
      redirect_to party_edit_path(@party.id), notice: 'Error al editar party rey'
    end
  end

  def delete
    @party = Party.find(params[:id])
    @party.destroy
    redirect_to parties_index_path
  end

  def bet
    @assistant = Assistant.new
    @party = Party.find(params[:id])
  end

  def create_bet
    @party = Party.find(params[:id])
    @assistant_param = params.require(:assistant).permit(:bet, :user_id, :party_id)
    @todos_los_asistentes = Assistant.all
    @mis_asistentes = []
    @menor = nil

    @todos_los_asistentes.each do |relacion|
      @mis_asistentes.append(relacion) if relacion.party_id == @party.id
    end
    # caso en que hay menos asistentes que el limite de cantidad
    if @mis_asistentes.length < @party.capacidad
      @assistant = Assistant.create(@assistant_param)
      if @assistant.save
        redirect_to parties_index_path
      else
        redirect_to party_bet_path(@party.id), notice: 'Error al hacer la apuesta'
      end
    else

      @mis_asistentes.each do |relacion|
        if @menor.nil?
          @menor = relacion
        else
          @menor = relacion if @menor.bet > relacion.bet
        end
      end

      if @menor.update(@assistant_param)
        redirect_to parties_index_path
      else
        redirect_to party_bet_path(@party.id), notice: 'Caso que aun no veo'
      end

    end
  end

  def edit_bet
    @party = Party.find(params[:id])
    @assistant = nil
    Assistant.all.each do |comparar|
      @assistant = comparar if (comparar.user_id == current_user.id) && (comparar.party_id == @party.id)
    end
  end

  def update_bet
    @party = Party.find(params[:id])
    @assistant_param = params.require(:assistant).permit(:bet, :user_id, :party_id)

    @assistant = nil
    Assistant.all.each do |comparar|
      @assistant = comparar if (comparar.user_id == current_user.id) && (comparar.party_id == @party.id)
    end

    if @assistant.update(@assistant_param)
      redirect_to parties_index_path
    else
      redirect_to party_edit_path(@party.id), notice: 'Error al editar la apuesta'
    end
  end
end
