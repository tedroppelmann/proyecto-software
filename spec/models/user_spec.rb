# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
    it 'creates correctly' do
      usuario = User.new(first_name: 'Tomás', last_name: 'Nora', email: 'tomas@tomas.com', password: 'dubost', password_confirmation: 'dubost', admin: false, monedero: 0, image: nil)
      expect(usuario).to be_valid
    end
    it 'does not create because do not have a admin' do
        usuario = User.new(first_name: 'Tomás', last_name: 'Nora', email: 'tomas@tomas.com', password: 'dubost', password_confirmation: 'dubost', monedero: 0, image: nil)
        expect(usuario).to be_valid
    end
    it 'does not create because do not have a monedero' do
        usuario = User.new(first_name: 'Tomás', last_name: 'Nora', email: 'tomas@tomas.com', password: 'dubost', password_confirmation: 'dubost', admin: false, image: nil)
        expect(usuario).to be_valid
    end
    it 'does not create because do not have a image' do
        usuario = User.new(first_name: 'Tomás', last_name: 'Nora', email: 'tomas@tomas.com', password: 'dubost', password_confirmation: 'dubost', admin: false, monedero: 0)
        expect(usuario).to be_valid
    end
    context 'when you try to create a user with out a first_name' do
        it 'does not create because do not have a first_name' do
            usuario = User.new(last_name: 'Nora', email: 'tomas@tomas.com', password: 'dubost', password_confirmation: 'dubost', admin: false, monedero: 0, image: nil)
            expect(usuario).not_to be_valid
        end
        it 'does not create because do not have a last_name' do
            usuario = User.new(first_name: 'Tomás', email: 'tomas@tomas.com', password: 'dubost', password_confirmation: 'dubost', admin: false, monedero: 0, image: nil)
            expect(usuario).not_to be_valid
        end
        it 'does not create because do not have a email' do
            usuario = User.new(first_name: 'Tomás', last_name: 'Nora', password: 'dubost', password_confirmation: 'dubost', admin: false, monedero: 0, image: nil)
            expect(usuario).not_to be_valid
        end
        it 'does not create because do not have a password' do
            usuario = User.new(first_name: 'Tomás', last_name: 'Nora', email: 'tomas@tomas.com', password_confirmation: 'dubost', admin: false, monedero: 0, image: nil)
            expect(usuario).not_to be_valid
        end
        it 'does not create because do not have a password_confirmation' do
            usuario = User.new(first_name: 'Tomás', last_name: 'Nora', email: 'tomas', password: 'dubost', password_confirmation: 'dubost', admin: false, monedero: 0, image: nil)
            expect(usuario).not_to be_valid
        end
    end
end