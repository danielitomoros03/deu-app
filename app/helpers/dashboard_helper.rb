module DashboardHelper
  DEPARTMENT_TO_PAGE_GROUP = {
    relaciones_interinstitucionales: "departamento1",
    extension_social_universitaria: "departamento2",
    educacion_continua_y_permanente: "departamento3",
    division_de_proyectos_y_programas: "departamento4",
    programas_regionales: "programa2",
    proyectos_productos_y_servicios: "programa3"
  }.freeze

  # Método helper para determinar qué grupos mostrar en el formulario
  def allowed_groups_for_form(page)
    if current_user&.present? && !current_user.super_admin?
      user_group = DEPARTMENT_TO_PAGE_GROUP[current_user.department&.to_sym]
      return [] unless user_group.present? && Page.groups.key?(user_group)

      return [[user_group.humanize, user_group]]
    end

    if page.persisted?
      # Para edición, mostrar todos los grupos
      Page.groups.map { |key, value| [key.humanize, key] }
    else
      # Para nueva página, solo programas y departamentos
      allowed_groups = ['programa2', 'programa3', 'departamento1', 'departamento2', 'departamento3', 'departamento4']
      Page.groups.select { |key, value| allowed_groups.include?(key) }
              .map { |key, value| [key.humanize, key] }
    end
  end

  # Método helper para determinar subgrupos iniciales
  def allowed_subgroups_for_group(group, current_subgroup)
    return [] unless group
    
    subgroup_mapping = {
      'inicio': ['title', 'view1', 'view2', 'view3', 'diplomado1', 'diplomado2', 'diplomado3'],
      'nosotros': ['title', 'description', 'value1', 'value2', 'value3', 'value4', 'functions', 'historical_review', 'director', 'sub_director', 'head_division', 'infogram'],
      'programa2': ['title', 'description', 'objectives', 'functions', 'contact'],
      'programa3': ['title', 'description', 'objectives', 'functions', 'contact'],
      'departamento1': ['title', 'description', 'objectives', 'functions', 'contact'],
      'departamento2': ['title', 'description', 'objectives', 'functions', 'contact'],
      'departamento3': ['title', 'description', 'objectives', 'functions', 'contact'],
      'departamento4': ['title', 'description', 'objectives', 'functions', 'contact'],
      'grupos_extension': ['title', 'description', 'objectives', 'functions', 'contact'],
      'certificaciones': ['title', 'description', 'objectives', 'functions', 'contact'],
      'espacios_universitarios': ['title', 'description', 'objectives', 'functions', 'contact']
    }
    
    allowed_subgroups = subgroup_mapping[group.to_sym] || []
    Page.subgroups.select { |key, value| allowed_subgroups.include?(key) }
            .map { |key, value| [key.humanize, key] }
  end
end