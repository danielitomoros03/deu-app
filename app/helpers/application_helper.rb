module ApplicationHelper
  def group_badge_class(group)
    case group
    when 'inicio'
      'bg-primary'
    when 'nosotros'
      'bg-success'
    when 'programa1', 'programa2', 'programa3'
      'bg-info'
    when 'departamento1', 'departamento2', 'departamento3'
      'bg-warning'
    when 'grupos_extension'
      'bg-purple' # Puedes agregar este color en tu CSS
    when 'espacios_universitarios'
      'bg-orange' # Puedes agregar este color en tu CSS
    when 'certificaciones'
      'bg-indigo' # Puedes agregar este color en tu CSS
    when 'contactenos'
      'bg-teal' # Puedes agregar este color en tu CSS
    else
      'bg-secondary'
    end
  end

  def subgroup_badge_class(subgroup)
    case subgroup
    when 'title'
      'bg-primary'
    when 'large_description'
      'bg-success'
    when 'short_description2'
      'bg-info'
    when 'objectives'
      'bg-warning'
    when 'functions'
      'bg-purple'
    when 'contact'
      'bg-teal'
    else
      'bg-secondary'
    end
  end
end