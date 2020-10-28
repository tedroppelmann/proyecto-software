# frozen_string_literal: true

class Service < ApplicationRecord
  validates :nombre, presence: true
  validates :descripcion, presence: true
  validates :cap_max, presence: true, numericality: { only_interger: true }
  validates :precio, presence: true, numericality: { only_interger: true }
end
