# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  respond_to :html

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = Operations::User::Create.call(user_params)

    return respond_with_errors(@user) unless @user.valid?

    render :show
  end

  def update
    return render :show if update_user

    respond_with_errors(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def update_user
    Operations::User::Update.call(
      user:        @user,
      user_params: user_params
    )
  end

  def user_locale
    t('activerecord.models.user.one')
  end
end
