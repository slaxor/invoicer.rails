class ContactsController < ApplicationController
  def index
    render :json => @current_user.contacts
  end

  def show
    render :json => @current_user.contacts.find(params[:id])
  end

  def create
    render :json => @current_user.contacts << Contact.create(params[:contacts])
  end

  def update
    render :json => @current_user.contacts.update(params[:id], params[:contacts])
  end

  def destroy
    render :json => @current_user.contacts.destroy(params[:id])
  end
end
