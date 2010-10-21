class ContactsController < BackboneController
  private
  def query_model(options = {})
    action = options[:action] || params[:action]
    case action
    when 'index'
      current_user.customers.find(params[:customer_id]).contacts
    when 'show'
      current_user.customers.find(params[:customer_id]).contacts.find(params[:id])
    when 'create'
      (current_user.customers.find(params[:customer_id]).contacts << Contact.create(params[:model])).last
    when 'update'
      current_user.customers.find(params[:customer_id]).contacts.update(params[:id], params[:model])
    when 'destroy'
      current_user.customers.find(params[:customer_id]).contacts.destroy(params[:id])
    end
  end
end
