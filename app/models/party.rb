# frozen_string_literal: true

class Party < ApplicationRecord
    belongs_to :user
    belongs_to :comunas
end
