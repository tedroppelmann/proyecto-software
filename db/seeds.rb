# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 

########USUARIOS############
admin = User.create({first_name: 'admin', last_name: 'admin', email: 'admin@gmail.com', password: 'administrador', password_confirmation: 'administrador', admin: true, monedero: 0, image: nil})
#droppelmann = User.create({first_name: 'Tomás', last_name: 'Droppelmann', email: 'tomas_droppelmann@gmail.com', password: 'droppelmann', password_confirmation: 'droppelmann', admin: false, monedero: 0,  image: nil})
#dubost = User.create({first_name: 'Tomás', last_name: 'Dubost', email: 'tomas_dubost@gmail.com', password: 'dubost', password_confirmation: 'dubost', admin: false, monedero: 0})
#soto = User.create({first_name: 'Tomás', last_name: 'Soto', email: 'tomas_soto@gmail.com', password: 'sotosoto', password_confirmation: 'sotosoto', admin: false, monedero: 0,  image: nil})
1.times do
    user = User.new
    user.email= "tomas_soto@gmail.com"
    user.first_name = "Tomás"
    user.last_name = "Soto"
    user.password = "sotosoto"
    user.password_confirmation = "sotosoto"
    user.admin = false
    #user.avatar = image_fetcher
    user.save!
    #app\assets\images\Default\default_software.jpg
    user.image.attach(io: File.open("app/assets/images/Default/perfil_defecto.webp"), filename: "perfil_defecto.webp")

end
1.times do
    user = User.new
    user.email= "tomas_dubost@gmail.com"
    user.first_name = "Tomás"
    user.last_name = "Dubost"
    user.password = "dubost"
    user.password_confirmation = "dubost"
    user.admin = false
    #user.avatar = image_fetcher
    user.save!
    #app\assets\images\Default\default_software.jpg
    user.image.attach(io: File.open("app/assets/images/Default/perfil_defecto.webp"), filename: "perfil_defecto.webp")

end
1.times do
    user = User.new
    user.email= "tomas_droppelmann@gmail.com"
    user.first_name = "Tomás"
    user.last_name = "Droppelmann"
    user.password = "droppelmann"
    user.password_confirmation = "droppelmann"
    user.admin = false
    #user.avatar = image_fetcher
    user.save!
    #app\assets\images\Default\default_software.jpg
    user.image.attach(io: File.open("app/assets/images/Default/perfil_defecto.webp"), filename: "perfil_defecto.webp")

end
###########COMUNAS###########
lo_barnechea = Comuna.create(nombre: "Lo Barnechea")
la_reina = Comuna.create(nombre: "La Reina")
las_condes = Comuna.create(nombre: "Las Condes")
san_joaquin = Comuna.create(nombre: "San Joaquin")

###########SERVICIOS#########

