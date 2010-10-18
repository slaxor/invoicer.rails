class UsersController < ApplicationController

  before_filter :require_no_user, :only => [:new, :create]
  skip_before_filter :require_user, :only => [:show, :edit, :update]

  layout 'user'

  def new
    @user = User.new
  end

  def create
    render :json => User.create(params[:user])
  end

  def show
    redirect_to new_user_session_path if current_user.nil?
  end

  def update
    render :json => @current_user.update(params[:user])
  end

  def destroy
    render :json => @current_user.destroy
  end

  def environment
    respond_to do |format|
    format.js {render :json => {:rails_env => {
      :current_user => @current_user.attributes.slice('id', 'login', 'email','current_login_ip')
    }}}
    end
  end
end
