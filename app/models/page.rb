# == Schema Information
#
# Table name: pages
#
#  id                :bigint           not null, primary key
#  group             :integer
#  name              :string
#  short_description :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Page < ApplicationRecord


    # enum group: { general: 0, diplomados: 1, programas: 2 }

    # Define enums for group and subgroup with specific mappings
    enum group: { 
        inicio: 0, nosotros: 1, programa1: 3, programa2: 4, programa3: 5, departamento1: 6,
        departamento2: 7, departamento3: 8, grupos_extension: 9, espacios_universitarios: 10,
        certificaciones: 11, contactenos: 12
    }
    enum subgroup: { 
        title: 0, large_description: 1, short_description: 2, objectives: 3, functions: 4, contact: 5
    }

end
