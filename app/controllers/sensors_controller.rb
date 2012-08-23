class SensorsController < ApplicationController
  def create
    @sensor = Sensor.new()
    @sensor.value = params[:data][:TemperatureWallrouter]
    @sensor.sensor_name = 'Temperature'
    @sensor2 = Sensor.new()
    @sensor2.value = params[:data][:LightWallrouter]
    @sensor2.sensor_name = 'Light'
      if @sensor.save && @sensor2.save
        render :text => '', :status => 200
      end
  end
end
