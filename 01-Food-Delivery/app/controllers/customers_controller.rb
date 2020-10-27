require_relative '../views/customer_view'
require_relative '../models/customer'

class CustomersController
  def initialize(repository)
    @repository = repository
    @view = CustomerView.new
  end

  def add
    name = @view.ask_for_name
    address = @view.ask_for_address
    customer = Customer.new(name: name, address: address)
    @repository.create(customer)
  end

  def list
    customers = @repository.all
    @view.display(customers)
  end
end
