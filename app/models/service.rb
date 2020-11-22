# frozen_string_literal: true

class Service < ApplicationRecord
  validates :nombre, presence: true
  validates :descripcion, presence: true
  validates :cap_max, presence: true, numericality: { only_interger: true }
  validates :precio, presence: true, numericality: { only_interger: true }
  validates :user_id, presence: true
  #validates :verified, presence: true
  has_many :comentarios, dependent: :destroy
  belongs_to :user
  has_and_belongs_to_many :comunas
  has_and_belongs_to_many :partys
end
