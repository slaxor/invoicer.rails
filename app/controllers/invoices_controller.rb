class InvoicesController < ApplicationController
  def index
    render :json => @current_user.customer.find(params[:customer_id]).invoices
  end

  def show
    respond_to do |format|
      format.json { render :json => @current_user.customer.find(params[:customer_id]).invoices.find(params[:id])}
      format.tex {
        @invoice = @current_user.customer.find(params[:customer_id]).invoices.find(params[:id])
      }
    end
  end

  def create
    render :json => @current_user.customer.find(params[:customer_id]).invoices << Contact.create(params[:customer.find(params[:invoice])
  end

  def update
    render :json => @current_user.customer.find(params[:customer_id]).invoices.update(params[:id], params[:id], params[:invoice])
  end

  def destroy
    render :json => @current_user.customer.find(params[:customer_id]).invoices.destroy(params[:id])
  end
end
