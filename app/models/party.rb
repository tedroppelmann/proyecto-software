# frozen_string_literal: true

class Party < ApplicationRecord
    belongs_to :user
    belongs_to :comuna

    #para ver lo de las apuestas
    has_many :assistants
    has_many :users, through: :assistants
end
