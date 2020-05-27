# frozen_string_literal: true

class UsersController < ApplicationController

  before_action :authenticate_user!
  def index
    unless PermissionChecker.new(current_user).can?(:view_users)
      redirect_to root_path, alert: "You can not access this page" && return
    end
    @users = User.page(params[:page]).per(params[:per])
  end

  def destroy
    unless PermissionChecker.new(current_user).can?(:delete_user)
      redirect_to root_path, alert: "You can not access this page" && return
    end

    @user = User.find(params[:id])
    if @user.present?
      @user.destroy
      redirect_to :index, alert: "Deleted #{@user.name}"
    else
      redirect_to :index, alert: "User not found"
    end
  end
end
