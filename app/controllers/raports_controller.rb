class RaportsController < ApplicationController
  # GET /raports
  # GET /raports.json
  def index
    @raports = Raport.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @raports }
    end
  end

  # GET /raports/1
  # GET /raports/1.json
  def show
    @raport = Raport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @raport }
    end
  end

  # GET /raports/new
  # GET /raports/new.json
  def new
    @raport = Raport.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @raport }
    end
  end

  # GET /raports/1/edit
  def edit
    @raport = Raport.find(params[:id])
  end

  # POST /raports
  # POST /raports.json
  def create
    @raport = Raport.new(params[:raport])

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

  # PUT /raports/1
  # PUT /raports/1.json
  def update
    @raport = Raport.find(params[:id])

    respond_to do |format|
      if @raport.update_attributes(params[:raport])
        format.html { redirect_to @raport, notice: 'Raport was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @raport.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /raports/1
  # DELETE /raports/1.json
  def destroy
    @raport = Raport.find(params[:id])
    @raport.destroy

    respond_to do |format|
      format.html { redirect_to raports_url }
      format.json { head :no_content }
    end
  end
end
