class CustomersController < BackboneController
  private
  def query_model(options = {})
    action = options[:action] || params.delete(:action)
    debugger
    case action
    when 'index'
      current_user.customers
    when 'show'
      current_user.customers.find(params[:id])
    when 'create'
      (current_user.customers << Customer.create!(params[:customer])).last
    when 'update'
      current_user.customers.update(params[:id], params[:customer])
    when 'destroy'
      current_user.customers.destroy(params[:id])
    end
  end
end
