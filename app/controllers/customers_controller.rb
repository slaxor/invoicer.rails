class CustomersController < BackboneController
  private
  def model
    Customer
  end

  def collection
    current_user.customers
  end
end
