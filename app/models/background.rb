# == Schema Information
# Schema version: 20100709022744
#
# Table name: backgrounds
#
#  id               :integer         not null, primary key
#  current_school   :string(255)
#  schools_attended :string(255)
#  major            :string(255)
#  short_bio        :text
#  superpower       :string(255)
#  website          :string(255)
#  interests        :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Background < ActiveRecord::Base
end
