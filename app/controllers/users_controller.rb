class UsersController < ApplicationController
  before_filter :login_required, :only => [:index, :edit, :update, :show, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def create                                                
    @user = User.new(params[:user])                         
    if @user.save                                           
      flash[:success] = "Welcome to the Laboratory Control System"
      session[:user_id] = @user.id                          
      redirect_to @user                                     
    else                                                    
      @title = "Sign up"                                    
      render 'new'                                          
    end                                                     
  end                                                       

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
