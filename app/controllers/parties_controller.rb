# frozen_string_literal: true

class PartiesController < ApplicationController
  def index
    @parties = Party.all
  end

  def new
    @party = Party.new
    @comunas = Comuna.all
    @lista = []
    @comunas.each do |comuna|
      @lista.append(comuna.id)
    end
  end

  def create
    @parties_param = params.require(:party).permit(:titulo, :descripcion, :direccion, :capacidad, :costo, :user_id, :comuna_id)
    @party = Party.create(@parties_param)
    

    if @party.save
      redirect_to parties_index_path
    else
      redirect_to parties_new_path, notice: 'Error al crear tu party'
    end
  end

  def show
    @party = Party.find(params[:id])
  end

  def edit
    @party = Party.find(params[:id])
  end

  def update
    @party = Party.find(params[:id])
    @parties_param = params.require(:party).permit(:titulo, :descripcion, :direccion, :capacidad, :costo)

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
    @assistant = Assistant.create(@assistant_param)
    

    if @assistant.save
      redirect_to parties_index_path
    else
      redirect_to party_bet_path(@party.id), notice: 'Error al hacer la apuesta'
    end
  end
end
