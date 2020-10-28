# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comuna, type: :model do
  it 'creates correctly' do
    comuna = Comuna.new(nombre: 'San Joaquin')
    expect(comuna).to be_valid
  end

  context 'when you try to create a comuna with out a name' do
    it 'does not create because do not have a name' do
      comuna = Comuna.new
      expect(comuna).not_to be_valid
    end
  end
end
