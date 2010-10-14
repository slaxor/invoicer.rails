class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  layout 'user'
  def new
    @user = User.new
  end

  def create
    render :json => User.create(params[:user])
  end

  def show
  end

  def update
    render :json => @current_user.update(params[:user])
  end

  def destroy
    render :json => @current_user.destroy
  end
end
