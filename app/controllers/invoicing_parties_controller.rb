class InvoicingPartiesController < BackboneController
  private
  def query_model(options = {})
    action = options[:action] || params[:action]
    case action
    when 'index'
      current_user.invoicing_parties
    when 'show'
      current_user.invoicing_parties.find(params[:id])
    when 'create'
      (current_user << InvoicingParty.create(params[:model])).last
    when 'update'
      current_user.invoicing_parties.update(params[:id], params[:model])
    when 'destroy'
      current_user.invoicing_parties.destroy(params[:id])
    end
  end
end
