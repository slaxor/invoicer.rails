class UserSessionsController < ApplicationController
  skip_before_filter :require_user, :only => [:new, :create]
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:destroy, :show]

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.create(params[:user_session])
    flash[:notice] = "Login successful!"
    current_user = User.find_by_login(['?', @user_session.login])
    redirect_to current_user
  rescue
    render :action => :new
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_user_session_url
  end
end

