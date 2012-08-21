class RaportsController < ApplicationController
  before_filter :login_required, :only => [:index, :show, :destroy]

  def index
    @raports = Raport.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @raports }
    end
  end

  def show
    @raport = Raport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @raport }
    end
  end

  def create
    @raport = Raport.new(params[:raport])
    @ROM = params[:raport].delete(:ROM)
    @user = User.find_or_create_by_code @ROM
    respond_to do |format|
      if @raport.save
        format.html { redirect_to @raport, notice: 'Raport was successfully created.' }
        format.json { render json: @raport, status: :created, location: @raport }
      else
        format.html { render action: "new" }
        format.json { render json: @raport.errors, status: :unprocessable_entity }
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
