class InvoicesController < BackboneController
  def show
    respond_to do |format|
      @invoice = current_user.customers.find(params[:customer_id]).invoices.find(params[:id])
      format.json { render :json => {:model => @invoice }}
      format.html { render :json => {:model => @invoice }}
      format.tex do
        @invoice.update_attribute(:printed_at, Time.now) unless @invoice.printed_at
        headers['Content-Disposition'] = %Q(attachment; filename="invoice_#{@invoice.customer.name}_#{@invoice.number}.tex")
      end
      format.pdf do
        @invoice.update_attribute(:printed_at, Time.now) unless @invoice.printed_at
        prawnto(
          :filename => "invoice_#{@invoice.customer.name}_#{@invoice.number}.pdf",
          :prawn => {:page_size => 'A4', :left_margin => 80, :right_margin => 50, :bottom_margin => 10 }
        )
      end
    end
  end

  private
  def query_model(options = {})
    action = options[:action] || params[:action]
    case action
    when 'index'
      current_user.customers.find(params[:customer_id]).invoices
    when 'create'
      (current_user.customers.find(params[:customer_id]).invoices << Invoice.create(params[:model])).last
    when 'update'
      current_user.customers.find(params[:customer_id]).invoices.update(params[:id], params[:model])
    when 'destroy'
      current_user.customers.find(params[:customer_id]).invoices.destroy(params[:id])
    end
  end
end
