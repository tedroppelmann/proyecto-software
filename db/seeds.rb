# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.create({first_name: 'admin', email: 'admin@gmail.com', password: 'administrador', password_confirmation: 'administrador', admin: true})

lo_barnechea = Comuna.create(nombre: "Lo Barnechea")
la_reina = Comuna.create(nombre: "La Reina")
las_condes = Comuna.create(nombre: "Las Condes")
san_joaquin = Comuna.create(nombre: "San Joaquin")