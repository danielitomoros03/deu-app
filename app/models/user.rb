# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  department             :integer          default("relaciones_interinstitucionales")
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  lastname               :string
#  name                   :string
#  number_phone           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  ## Enum based on frontend DEU sections and seed content names
  DEPARTMENT_LABELS = {
    relaciones_interinstitucionales: "Departamento de Relaciones Interinstitucionales",
    extension_social_universitaria: "Departamento Extension Social Universitaria",
    educacion_continua_y_permanente: "Departamento de Educacion Continua y Permanente",
    division_de_proyectos_y_programas: "Division de Proyectos y Programas",
    programas_regionales: "Programas Regionales",
    proyectos_productos_y_servicios: "Proyecto, Productos y Servicios"
  }.freeze

  SUPER_ADMIN_EMAILS = ENV.fetch("DEU_SUPER_ADMIN_EMAILS", "danielito.moros03@gmail.com")
                           .split(",")
                           .map(&:strip)
                           .map(&:downcase)
                           .freeze

  # Keep enum available even if schema is temporarily out of sync.
  attribute :department, :integer, default: 0

  enum department: {
    relaciones_interinstitucionales: 0,
    extension_social_universitaria: 1,
    educacion_continua_y_permanente: 2,
    division_de_proyectos_y_programas: 3,
    programas_regionales: 4,
    proyectos_productos_y_servicios: 5
  }

  def self.department_options_for_select
    departments.keys.map do |key|
      [DEPARTMENT_LABELS[key.to_sym] || key.humanize, key]
    end
  end

  def department_label
    self.class::DEPARTMENT_LABELS[department&.to_sym] || department&.humanize
  end

  def super_admin?
    email.present? && self.class::SUPER_ADMIN_EMAILS.include?(email.downcase)
  end
end
