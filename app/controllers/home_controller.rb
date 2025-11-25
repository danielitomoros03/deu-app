class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    # Obtener SOLO las 3 páginas específicas que necesitamos, sin duplicados
    @espacios_page = Page.find_by(group: 'inicio', subgroup: 'view1')
    @estructura_page = Page.find_by(group: 'inicio', subgroup: 'view2')
    @certificaciones_page = Page.find_by(group: 'inicio', subgroup: 'view3')
    
    # Crear array solo con las páginas que existen
    @inicio_pages = []
    @inicio_pages << @espacios_page if @espacios_page
    @inicio_pages << @estructura_page if @estructura_page
    @inicio_pages << @certificaciones_page if @certificaciones_page
    
    # Pasar a Gon
    gon.inicio_pages = @inicio_pages.as_json(only: [:id, :name, :group, :subgroup, :short_description])
    
    puts "=== PÁGINAS CARGADAS ==="
    puts "Total: #{@inicio_pages.count}"
    @inicio_pages.each do |page|
      puts "- #{page.name} (subgroup: #{page.subgroup})"
    end
  end
end