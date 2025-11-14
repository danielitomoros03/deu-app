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
require "test_helper"

class PageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
