class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # before_action :check_if_logged_in_and_admin
  #GET /user
  #GET /users.json
  def index
    @users= User.all 
  end

  def show
    @user = User.find params[:id]
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @user.to_json }
    end
  end

  def edit
    @user = User.find params[:id]
  end


  def update 
    @user = User.find params[:id]
    @user.update user_params
    redirect_to user_path(params[:id])
  end


  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully burned.' }
      format.json { head :no_content }
    end
end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :address, :phone)
    end
end
