# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    return unless user.persisted?

    if user.super_admin?
      can :manage, :all
      return
    end

    own_department_key = user.department&.to_sym
    own_department_value = User.departments[user.department]

    # Users can only manage users from their own department.
    if own_department_value
      can [:read, :update, :destroy], User, department: own_department_value
      can :new, User
      can :create, User do |new_user|
        new_user.department.to_s == user.department.to_s
      end
    end

    # Departments map to the corresponding page groups.
    page_group_by_department = {
      relaciones_interinstitucionales: :departamento1,
      extension_social_universitaria: :departamento2,
      educacion_continua_y_permanente: :departamento3,
      division_de_proyectos_y_programas: :departamento4,
      programas_regionales: :programa2,
      proyectos_productos_y_servicios: :programa3
    }

    allowed_group_key = page_group_by_department[own_department_key]
    allowed_group_value = Page.groups[allowed_group_key.to_s] if allowed_group_key

    if allowed_group_value
      can :new, Page
      can [:read, :update, :destroy], Page, group: allowed_group_value
      can :create, Page do |page|
        page.group_before_type_cast.to_i == allowed_group_value
      end
    end

    # Events are global resources; non-super-admin users get read-only access.
    can :read, Event
  end
end
