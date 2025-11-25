# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Iniciando carga de datos semilla..."

# Crear usuario admin
User.create!(email: "danielito.moros03@gmail.com", password: "123123");
if User.where(email: "danielito.moros03@gmail.com").exists?
  puts "Usuario admin creado con éxito."
  else
  puts "Error al crear el usuario admin."
end

# DEFINIR LAS 3 PÁGINAS EXACTAS QUE NECESITAMOS
required_pages = [
  {
    name: "Espacios Universitarios",
    group: "inicio",
    subgroup: "view1",
    short_description: "Descubre cómo acceder y hacer uso de nuestras instalaciones para actividades académicas, culturales y recreativas, fomentando un entorno de aprendizaje e integración."
  },
  {
    name: "Estructura Organizativa", 
    group: "inicio",
    subgroup: "view2",
    short_description: "Conoce la organización y funcionamiento de nuestra institución, diseñada para garantizar una gestión eficiente y una mejor experiencia académica y administrativa."
  },
  {
    name: "Certificaciones y Avales",
    group: "inicio", 
    subgroup: "view3",
    short_description: "Obtén reconocimientos oficiales que validan tu formación y experiencia, respaldados por nuestra institución y aliados estratégicos."
  }
]

# Usar find_or_create_by para mantener IDs si existen
required_pages.each do |page_attrs|
  page = Page.find_or_initialize_by(
    group: page_attrs[:group],
    subgroup: page_attrs[:subgroup]
  )
  
  page.name = page_attrs[:name]
  page.short_description = page_attrs[:short_description]
  
  if page.save
    puts "✓ Página '#{page_attrs[:name]}' #{page.new_record? ? 'creada' : 'actualizada'} (ID: #{page.id})"
  else
    puts "✗ Error página '#{page_attrs[:name]}': #{page.errors.full_messages.join(', ')}"
  end
end

# Eliminar páginas de inicio que no son las 3 requeridas
Page.where(group: 'inicio')
   .where.not(subgroup: ['view1', 'view2', 'view3'])
   .destroy_all

puts "¡Proceso completado!"
puts "Total páginas de inicio: #{Page.where(group: 'inicio').count}"