# frozen_string_literal: true

class Comuna < ApplicationRecord
  validates :nombre, presence: true
  has_many :partys
end
