class ServiceInvoiceItemsController < BackboneController
  private
  def query_model(options = {})
    action = options[:action] || params[:action]
    case action
    when 'index'
      current_user.customers.find(params[:customer_id]).invoices.find(params[:invoice_id]).service_invoice_items
    when 'show'
      current_user.customers.find(params[:customer_id]).invoices.find(params[:invoice_id]).service_invoice_items.find(params[:id])
    when 'create'
      (current_user.customers.find(params[:customer_id]).invoices.find(params[:invoice_id]).service_invoice_items << Pause.create(params[:model])).last
    when 'update'
      current_user.customers.find(params[:customer_id]).invoices.find(params[:invoice_id]).service_invoice_items.update(params[:id], params[:model])
    when 'destroy'
      current_user.customers.find(params[:customer_id]).invoices.find(params[:invoice_id]).service_invoice_items.destroy(params[:id])
    end
  end
end

