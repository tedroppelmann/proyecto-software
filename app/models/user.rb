# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :partys, dependent: :destroy
  has_many :comentarios, dependent: :destroy
  has_many :services, dependent: :destroy
  # para ver lo de las apuestas
  has_many :assistants, dependent: :destroy
  has_many :partys, through: :assistants, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
