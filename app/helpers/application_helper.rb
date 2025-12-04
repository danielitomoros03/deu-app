module ApplicationHelper
  def group_badge_class(group)
    case group
    when 'inicio'
      'badge-primary'
    when 'nosotros'
      'badge-success'
    when 'programa1', 'programa2', 'programa3'
      'badge-info'
    when 'departamento1', 'departamento2', 'departamento3'
      'badge-warning'
    when 'grupos_extension'
      'badge-purple'
    when 'espacios_universitarios'
      'badge-orange'
    when 'certificaciones'
      'badge-indigo'
    when 'contactenos'
      'badge-teal'
    else
      'badge-secondary'
    end
  end

  def subgroup_badge_class(subgroup)
    case subgroup
    when 'title'
      'badge-primary'
    when 'large_description'
      'badge-success'
    when 'short_description2'
      'badge-info'
    when 'objectives'
      'badge-warning'
    when 'functions'
      'badge-purple'
    when 'contact'
      'badge-teal'
    else
      'badge-secondary'
    end
  end
end