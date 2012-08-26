class RaportsController < ApplicationController
  before_filter :login_required, :only => [:index, :show, :destroy]
  respond_to :html, :xml, :json, :js

  def index
    #@raports = Raport.all
    @raports = Raport.paginate(:page => params[:raport_page], :per_page => 10 )
    @sensorL = Sensor.find(:last, :conditions => {:sensor_name => 'Light'})
    @sensorT = Sensor.find(:last, :conditions => {:sensor_name => 'Temperature'})
    @new_raports = Raport.where("created_at > ?", Time.at(params[:after].to_i + 1))
  end

  def show
    @raport = Raport.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @raport }
    end
  end

  def create
    @raport = Raport.new(params[:raport])
    @ROM = params[:raport].delete(:body)
    @user = User.find_or_create_by_ROM @ROM
    @raport.user_id = @user.id
    respond_to do |format|
      if @raport.save
        format.html {redirect_to(users_path)}
      end
    end
  end

  def destroy
    @raport = Raport.find(params[:id])
    @raport.destroy

    respond_to do |format|
      format.html { redirect_to raports_url }
      format.json { head :no_content }
    end
  end
end
