# frozen_string_literal: true

class StaticPagesController < ApplicationController
  before_action :check_party

  def home 
  end

  private

  def check_party
    Party.all.each do |carrete|
      if Date.today == carrete.fecha and  carrete.revisado == false
        carrete.revisado = true
        carrete.save
        @recaudado = Assistant.where("party_id = ?", carrete.id).sum('bet')
        puts "----- LA RECAUDACION DEL CARRETE #{carrete.id} es de #{@recaudado}------------"
        @costos = 0
        carrete.services.each do |servicio|
          @costos = @costos + servicio.precio
        end
        puts "----- EL COSTO DEL CARRETE #{carrete.id} es de #{@costos}------------"
        if @recaudado >= @costos and @recaudado >= carrete.costo #se realiza el pago hacia los provedores de los ser y el resto al anfitrion del carrete
          carrete.hacer = true
          carrete.save
          puts "----- EL CARRETE #{carrete.id} SE REALIZA------------"
          carrete.services.each do |servicio|
            @provedor = User.find(servicio.user_id)
            @provedor.monedero = @provedor.monedero + servicio.precio
            @provedor.save
          end
          @anfitrion = User.find(carrete.user_id)
          @anfitrion.monedero = @anfitrion.monedero + @recaudado - @costos
          @anfitrion.save
        else #no se hace el carrete y hay que devolver la plata
          @devolucion = Assistant.where("party_id = ?", carrete.id)
          @devolucion.each do |persona|
            @persona_devolucion = User.find(persona.user_id)
            puts @persona_devolucion.email
            @persona_devolucion.monedero = @persona_devolucion.monedero + persona.bet
            @persona_devolucion.save
          end
        end
      end
    end
    

  end
end
