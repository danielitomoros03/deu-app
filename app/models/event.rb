# == Schema Information
#
# Table name: events
#
#  id         :bigint           not null, primary key
#  category   :integer          default("noticia")
#  day        :date
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Event < ApplicationRecord
    ## Other Attributes
    has_one_attached :image_event
    has_rich_text :description

    ## Enum for category
    enum category: { noticia: 0, evento: 1, convocatoria: 2}
end
