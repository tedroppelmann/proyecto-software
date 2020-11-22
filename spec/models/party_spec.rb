# frozen_string_literal: true

require 'rails_helper'
dubost = User.create({first_name: 'Tomás', last_name: 'Nora', email: 'tomas_dubost@gmail.com', password: 'dubost', password_confirmation: 'dubost', admin: false})
usuario = User.all
comuna_new = Comuna.create(nombre: 'San Joaquin')
comuna = Comuna.all

RSpec.describe Party, type: :model do
    it 'creates correctly' do
        party = Party.new(titulo: 'masivo', descripcion: 'fiesta masiva', direccion: 'mi casa', capacidad: 10, costo: 1000, user_id: usuario[0].id, comuna_id: comuna[0].id, service_ids: [], code: 123)
        expect(party).to be_valid
    end
    context 'when you try to create a party with out a titulo' do
        it 'does not create because do not have a contenido' do
            party = Party.new(descripcion: 'fiesta masiva', direccion: 'mi casa', capacidad: 10, costo: 1000, user_id: usuario[0].id, comuna_id: comuna[0].id, service_ids: [], code: 123)
            expect(party).not_to be_valid
        end
        it 'does not create because do not have a descripcion' do
            party = Party.new(titulo: 'masivo', direccion: 'mi casa', capacidad: 10, costo: 1000, user_id: usuario[0].id, comuna_id: comuna[0].id, service_ids: [], code: 123)
            expect(party).not_to be_valid
        end
        it 'does not create because do not have a direccion' do
            party = Party.new(titulo: 'masivo', descripcion: 'fiesta masiva', capacidad: 10, costo: 1000, user_id: usuario[0].id, comuna_id: comuna[0].id, service_ids: [], code: 123)
            expect(party).not_to be_valid
        end
        it 'does not create because do not have a capacidad' do
            party = Party.new(titulo: 'masivo', descripcion: 'fiesta masiva', direccion: 'mi casa', costo: 1000, user_id: usuario[0].id, comuna_id: comuna[0].id, service_ids: [], code: 123)
            expect(party).not_to be_valid
        end
        it 'does not create because do not have a costo' do
            party = Party.new(titulo: 'masivo', descripcion: 'fiesta masiva', direccion: 'mi casa', capacidad: 10, user_id: usuario[0].id, comuna_id: comuna[0].id, service_ids: [], code: 123)
            expect(party).not_to be_valid
        end
        it 'does not create because do not have a user_id' do
            party = Party.new(titulo: 'masivo', descripcion: 'fiesta masiva', direccion: 'mi casa', capacidad: 10, costo: 1000, comuna_id: comuna[0].id, service_ids: [], code: 123)
            expect(party).not_to be_valid
        end
        it 'does not create because do not have a comuna_id' do
            party = Party.new(titulo: 'masivo', descripcion: 'fiesta masiva', direccion: 'mi casa', capacidad: 10, costo: 1000, user_id: usuario[0].id, service_ids: [], code: 123)
            expect(party).not_to be_valid
        end
        it 'does not create because do not have a numerical costo' do
            party = Party.new(titulo: 'masivo', descripcion: 'fiesta masiva', direccion: 'mi casa', capacidad: 10, costo: 'uwu', user_id: usuario[0].id, comuna_id: comuna[0].id, service_ids: [], code: 123)
            expect(party).not_to be_valid
        end
        it 'does not create because do not have a numerical capacidad' do
            party = Party.new(titulo: 'masivo', descripcion: 'fiesta masiva', direccion: 'mi casa', capacidad: 'uwu', costo: 1000, user_id: usuario[0].id, comuna_id: comuna[0].id, service_ids: [], code: 123)
            expect(party).not_to be_valid
        end
        it 'does not create because do not have a code' do
            party = Party.new(titulo: 'masivo', descripcion: 'fiesta masiva', direccion: 'mi casa', capacidad: 'uwu', costo: 1000, user_id: usuario[0].id, comuna_id: comuna[0].id, service_ids: [])
            expect(party).not_to be_valid
        end
        it 'does not create because do not have a numerical costo' do
            party = Party.new(titulo: 'masivo', descripcion: 'fiesta masiva', direccion: 'mi casa', capacidad: 10, costo: 'hola', user_id: usuario[0].id, comuna_id: comuna[0].id, service_ids: [], code: 123)
            expect(party).not_to be_valid
        end
        it 'does not create because do not have a numerical capacidad' do
            party = Party.new(titulo: 'masivo', descripcion: 'fiesta masiva', direccion: 'mi casa', capacidad: 'hola', costo: 1000, user_id: usuario[0].id, comuna_id: comuna[0].id, service_ids: [], code: 123)
            expect(party).not_to be_valid
        end
    end
end
