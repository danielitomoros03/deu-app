class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    # Cargar todas las páginas que definimos en seeds.rb por grupos relevantes
    groups = %w[inicio programa2 programa3 departamento1 departamento2 departamento3 departamento4 grupos_extension espacios_universitarios certificaciones nosotros]

    pages = Page.where(group: groups)

    # Agrupar por group y serializar solo los campos necesarios para el frontend
    @pages_by_group = pages.group_by(&:group).transform_values do |pages_arr|
      pages_arr.map do |p|
        json = p.as_json(only: [:id, :name, :group, :subgroup, :short_description, :large_description])
        # Include ActionText large_description as HTML so frontend can render rich content
        json['large_description_html'] = p.large_description&.body&.to_html || ''
        json['large_description_raw'] = large_description_api_v1_page_url(p)
        # Include ActiveStorage image URLs for team photos and infogram
        json['team_image_url'] = p.team_image.attached? ? rails_blob_url(p.team_image, only_path: true) : nil
        json['infogram_image_url'] = p.infogram_image.attached? ? rails_blob_url(p.infogram_image, only_path: true) : nil
        json['section_image_url'] = p.section_image.attached? ? rails_blob_url(p.section_image, only_path: true) : nil
        json
      end
    end

    # Variables específicas para compatibilidad con vistas existentes
    @inicio_pages = @pages_by_group['inicio'] || []
    @espacios_page = Page.find_by(group: 'inicio', subgroup: 'view1')
    @estructura_page = Page.find_by(group: 'inicio', subgroup: 'view2')
    @certificaciones_page = Page.find_by(group: 'inicio', subgroup: 'view3')

    # Exponer a gon para que el frontend (Vue) pueda consumirlas via window.gon
    gon.inicio_pages = @inicio_pages

    # Exponer todos los grupos bajo gon.pages_by_group para consumos más avanzados
    gon.pages_by_group = @pages_by_group

    Rails.logger.info "=== PÁGINAS CARGADAS (Home#index) === total groups: #{@pages_by_group.keys.size}"
  end
end