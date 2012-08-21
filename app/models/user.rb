# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  name            :string(255)
#  ROM             :string(255)
#  password_digest :string(255)
#

class User < ActiveRecord::Base
   attr_accessible :name, :email,:cardN, :ROM, :password, :password_confirmation

   validates :ROM, :presence => true, :uniqueness => true
                                        
   has_secure_password                  
                                        
   validates_presence_of :password      

  def self.find_or_create_by_ROM (ROM)
    first(:conditions => {:ROM => ROM}) || create(:ROM => ROM) 
  end
end
