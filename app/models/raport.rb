# == Schema Information
#
# Table name: raports
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  body       :string(255)
#

class Raport < ActiveRecord::Base
   attr_accessible :body
end
