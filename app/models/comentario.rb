# frozen_string_literal: true

class Comentario < ApplicationRecord
    belongs_to :user
    belongs_to :service
end
