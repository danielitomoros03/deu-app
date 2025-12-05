# == Schema Information
#
# Table name: pages
#
#  id                :bigint           not null, primary key
#  group             :integer
#  name              :string
#  short_description :text
#  subgroup          :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Page < ApplicationRecord


    # enum group: { general: 0, diplomados: 1, programas: 2 }

    # Define enums for group and subgroup with specific mappings
    enum group: { 
        inicio: 0, nosotros: 1, programa2: 3, programa3: 4, departamento1: 5,
        departamento2: 6, departamento3: 7, departamento4: 8, grupos_extension: 9, espacios_universitarios: 10,
        certificaciones: 11, contactenos: 12
    }
    enum subgroup: { 
        title: 0, description: 1, view1: 2, view2: 3, view3: 4, objectives: 5, functions: 6, 
        contact: 7, value1: 8, value2: 9, value3: 10, value4: 11, historical_review: 12
    }

    has_rich_text :large_description

end
