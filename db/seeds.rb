# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# User.create!(email: "danielito.moros03@gmail.com", password: "123123");
# if User.where(email: "danielito.moros03@gmail.com").exists?
#   puts "Usuario admin creado con éxito."
# else
#   puts "Error al crear el usuario admin."
# end

puts "Creando datos de páginas para la API..."
Page.create!(
  name: "Misión y Visión",
  group: "general",
  short_description: "Contenido completo sobre la misión y visión de la DEU."
)

Page.create!(
  name: "Servicios de Extensión",
  group: "general",
  short_description: "Lista de todos los servicios ofrecidos en la universidad."
)

puts "¡Datos de páginas creados con éxito!"