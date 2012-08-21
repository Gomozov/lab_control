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
  # attr_accessible :title, :body
end
