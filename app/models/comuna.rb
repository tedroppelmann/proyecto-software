# frozen_string_literal: true

class Comuna < ApplicationRecord
  validates :nombre, presence: true
end
