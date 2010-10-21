class ServiceInvoiceItemsController < ApplicationController
  def index
    render :json => current_user.customers.find(params[:customer_id]).invoices.find(params[:invoice_id]).service_invoice_items
  end

  def create
    render :json => (current_user.customers.find(params[:customer_id]).invoices.find(params[:invoice_id]).service_invoice_items << ServiceInvoiceItem.create(params[:service_invoice_item])).last
  end

  def update
    render :json => current_user.customers.find(params[:customer_id]).invoices.find(params[:invoice_id]).service_invoice_items.update(params[:id], params[:id], params[:service_invoice_item])
  end

  def destroy
    render :json => current_user.customers.find(params[:customer_id]).invoices.find(params[:invoice_id]).service_invoice_items.destroy(params[:id])
  end

end
