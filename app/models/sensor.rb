class Sensor < ActiveRecord::Base
  attr_accessible :sensor_name, :value
  validates_presence_of :sensor_name, :value

end
