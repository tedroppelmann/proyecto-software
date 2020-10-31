# frozen_string_literal: true

class Party < ApplicationRecord
    belongs_to :user
    belongs_to :comuna
    has_and_belongs_to_many :services, dependent: :destroy
    

    #para ver lo de las apuestas
    has_many :assistants, dependent: :destroy
    has_many :users, through: :assistants
end
