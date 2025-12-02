class DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    # Obtener las páginas para la sección de inicio
    @inicio_pages = Page.where(group: 'inicio', subgroup: ['view1', 'view2', 'view3'])
                        .order(:subgroup)
    
    # Pasar los datos a Gon para Vue.js
    gon.inicio_pages = @inicio_pages.as_json(only: [:id, :name, :group, :subgroup, :short_description])
    
    # Para compatibilidad con el código existente
    @pages_all = Page.all
    @first_page = Page.first
    
    # Debug: verificar en consola
    puts "=== DATOS GON ==="
    puts "Páginas encontradas: #{@inicio_pages.count}"
    @inicio_pages.each do |page|
      puts "- #{page.name} (subgroup: #{page.subgroup})"
    end
  end
end