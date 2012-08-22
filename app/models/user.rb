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
#  email           :string(255)
#  cardN           :string(255)
#

class User < ActiveRecord::Base
   attr_accessible :name, :email, :cardN, :ROM, :password, :password_confirmation
   has_many :raports, :dependent => :destroy

   validates :ROM, :presence => true, :uniqueness => true
                                        
   has_secure_password                  
                                        
   validates_presence_of :password      

  def self.find_or_create_by_ROM (rom)
    first(:conditions => {:ROM => rom}) || create!(:ROM => rom, :password => '1', :password_confirmation => '1') 
  end
end
