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
   attr_accessible :body, :user_id
   belongs_to :user
   #default_scope :order => 'raports.created_at DESC'

end
