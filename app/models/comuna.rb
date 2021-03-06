# frozen_string_literal: true

class Comuna < ApplicationRecord
  validates :nombre, presence: true
  has_many :partys, dependent: :destroy
  has_and_belongs_to_many :services
end
