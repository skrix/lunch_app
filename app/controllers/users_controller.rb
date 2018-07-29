# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, except: %i[new create]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      format.html { redirect_to @user, notice: 'User was successfully created.' } if @user.save
      format.html { render :new } unless @user.save
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    successfully = 'User was successfully updated.'
    respond_to do |format|
      format.html { redirect_to @user, notice: successfully } if @user.update(user_params)
      format.html { render :edit } unless @user.update(user_params)
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:password)
  end
end
