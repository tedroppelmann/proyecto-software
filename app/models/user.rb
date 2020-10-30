# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :partys
  has_many :comentarios
  has_many :services
  #para ver lo de las apuestas
  has_many :assistants
  has_many :partys, through: :assistants

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
