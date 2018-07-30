# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      format.html { redirect_to @user, notice: 'User was successfully created.' } if @user.save
      format.html { render :new } unless @user.save
    end
  end

  def update
    successfully = 'User was successfully updated.'
    respond_to do |format|
      format.html { redirect_to @user, notice: successfully } if @user.update(user_params)
      format.html { render :edit } unless @user.update(user_params)
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
