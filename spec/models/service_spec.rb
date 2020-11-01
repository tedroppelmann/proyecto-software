# frozen_string_literal: true

require 'rails_helper'
dubost = User.create({first_name: 'Tomás', last_name: 'Nora', email: 'tomas_dubost@gmail.com', password: 'dubost', password_confirmation: 'dubost', admin: false})
usuario = User.all
RSpec.describe Service, type: :model do
  it 'creates correctly' do
    service = Service.new(nombre: 'los limpia pisos', descripcion: 'te voy a limpiar el piso al final del carrete', cap_max: 3, precio: 500, user_id: usuario[0].id)
    expect(service).to be_valid
  end

  context 'when you try to create a service with out a name' do
    it 'does not create because do not have a name' do
      service = Service.new(descripcion: 'te voy a limpiar el piso al final del carrete', cap_max: 3, precio: 500, user_id: usuario[0].id)
      expect(service).not_to be_valid
    end

    it 'does not create because do not have a description' do
      service = Service.new(nombre: 'los limpia pisos', cap_max: 3, precio: 500, user_id: usuario[0].id)
      expect(service).not_to be_valid
    end

    it 'does not create because do not have a cap_max' do
      service = Service.new(nombre: 'los limpia pisos', descripcion: 'te voy a limpiar el piso al final del carrete', precio: 500, user_id: usuario[0].id)
      expect(service).not_to be_valid
    end

    it 'does not create because do not have a precio' do
      service = Service.new(nombre: 'los limpia pisos', descripcion: 'te voy a limpiar el piso al final del carrete', cap_max: 3, user_id: usuario[0].id)
      expect(service).not_to be_valid
    end

    it 'does not create because do not have a user_id' do
      service = Service.new(nombre: 'los limpia pisos', descripcion: 'te voy a limpiar el piso al final del carrete', cap_max: 3, precio: 500)
      expect(service).not_to be_valid
    end
    
  end
end
