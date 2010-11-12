class UsersController < ApplicationController

  before_filter :require_no_user, :only => [:new, :create]
  skip_before_filter :require_user, :only => [:new, :create]

  layout 'user'

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if(@user.save)
      redirect_to root_path(@user)
    else
      render 'new'
    end
  end

  def show
    redirect_to new_user_session_path if current_user.nil?
  end

  def update
    current_user.update(params[:user])
    redirect_to new_user_session_path if current_user.nil?
  end

  def destroy
    current_user.destroy
    user_session.destroy
    redirect_to new_user_session_path
  end

  def environment
    respond_to do |format|
    format.js {render :json => {:rails_env => {
      :current_user => @current_user.attributes.slice('id', 'login', 'email','current_login_ip')
    }}}
    end
  end
end
