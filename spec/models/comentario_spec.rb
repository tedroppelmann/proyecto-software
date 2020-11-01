# frozen_string_literal: true

require 'rails_helper'
dubost = User.create({first_name: 'Tomás', last_name: 'Nora', email: 'tomas_dubost@gmail.com', password: 'dubost', password_confirmation: 'dubost', admin: false})
usuario = User.all
dubost = Service.create(nombre: 'los limpia pisos', descripcion: 'te voy a limpiar el piso al final del carrete', cap_max: 3, precio: 500, user_id: usuario[0].id)
service = Service.all

RSpec.describe Comentario, type: :model do
    it 'creates correctly' do
        comentario = Comentario.new(contenido: 'los limpia pisos', user_id: usuario[0].id, service_id: service[0].id)
        expect(comentario).to be_valid
    end
    context 'when you try to create a comentario with out a contenido' do
        it 'does not create because do not have a contenido' do
          comentario = Comentario.new(user_id: usuario[0].id, service_id: service[0].id)
          expect(comentario).not_to be_valid
        end
        it 'does not create because do not have a user_id' do
            comentario = Comentario.new(contenido: 'los limpia pisos', service_id: service[0].id)
            expect(comentario).not_to be_valid
         end
        it 'does not create because do not have a service_id' do
            comentario = Comentario.new(contenido: 'los limpia pisos', user_id: usuario[0].id)
            expect(comentario).not_to be_valid
        end
    end
end
