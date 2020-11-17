# frozen_string_literal: true

class Party < ApplicationRecord
  # para ver lo de las apuestas
  has_many :assistants, dependent: :destroy
  has_many :users, through: :assistants

  validates :titulo, presence: true
  validates :descripcion, presence: true
  validates :direccion, presence: true
  validates :capacidad, presence: true, numericality: { only_interger: true }
  validates :costo, presence: true, numericality: { only_interger: true }
  validates :user_id, presence: true
  validates :comuna_id, presence: true

  belongs_to :user
  belongs_to :comuna
  has_and_belongs_to_many :services, dependent: :destroy

end
