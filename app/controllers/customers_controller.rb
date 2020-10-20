require_relative "../views/customers_view"
require_relative "../models/customer"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  # Actions:
  def list
    # Ask REPO for customers
    customers = @customer_repository.all
    # Ask VIEW to display
    @customers_view.display_customers(customers)
  end

  def add
    # Ask VIEW for name
    customer_name = @customers_view.ask_for("name")
    # Ask VIEW for address
    customer_address = @customers_view.ask_for("address")
    # Ask Customer for an instance with this into
    customer = Customer.new(name: customer_name, address: customer_address)
    # Ask REPO to store the instance
    @customer_repository.create(customer)
  end
end
