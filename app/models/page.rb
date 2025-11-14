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


    enum group: { general: 0, diplomados: 1, programas: 2 }

end
