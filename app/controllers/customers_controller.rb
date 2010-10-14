class CustomersController < ApplicationController
   def index
    render :json => @current_user.customers
  end

  def show
    render :json => @current_user.customers.find(params[:id])
  end

  def create
    render :json => @current_user.customers << Customer.create(params[:customers])
  end

  def update
    render :json => @current_user.customers.update(params[:id], params[:customers])
  end

  def destroy
    render :json => @current_user.customers.destroy(params[:id])
  end
end
