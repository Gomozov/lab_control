class RaportsController < ApplicationController
  before_filter :login_required, :only => [:index, :show, :destroy]

  def index
    @raports = Raport.all

    respond_to do |format|
      format.html
      format.json { render json: @raports }
    end
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
      if @raport.save
        redirect_to(users_path)
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
