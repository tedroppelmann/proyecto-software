# frozen_string_literal: true

class Comentario < ApplicationRecord
  validates :contenido, presence: true
  validates :user_id, presence: true
  validates :service_id, presence: true
  belongs_to :user
  belongs_to :service
end
