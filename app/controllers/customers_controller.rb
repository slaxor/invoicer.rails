class CustomersController < ApplicationController
   def index
     render :json => { :models => @current_user.customers }
  end

  def show
    render :json => @current_user.customers.find(params[:id])
  end

  def create
    render :json => (@current_user.customers << Customer.create(JSON.parse(params[:model]))).last
  end

  def update
    render :json => @current_user.customers.update(params[:id], JSON.parse(params[:model]))
  end

  def destroy
    render :json => @current_user.customers.destroy(params[:id])
  end
end
