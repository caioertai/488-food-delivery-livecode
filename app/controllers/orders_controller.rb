require "pry-byebug"
require_relative "../views/orders_view"

class OrdersController
  def initialize(order_repository, meal_repository, customer_repository, employee_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository

    @orders_view = OrdersView.new
  end

  def list_undelivered
    # Ask ORDER REPO for undelivered orders
    orders = @order_repository.undelivered_orders
    # Ask VIEW to display them
    @orders_view.display_orders(orders)
  end

  def add
    # For an order instance I need:
    # 1. a meal instance
    # Ask MEAL REPO for the meals
    # Ask VIEW to display them
    # Ask VIEW for a instance of meal
    meals = @meal_repository.all
    meal_index = @orders_view.display_select(meals)
    meal = meals[meal_index]

    # 2. a customer instance
    customers = @customer_repository.all
    customer_index = @orders_view.display_select(customers)
    customer = customers[customer_index]

    # 3. an employee instance
    employees = @employee_repository.delivery_guys
    employee_index = @orders_view.display_select(employees)
    employee = employees[employee_index]

    order = Order.new(meal: meal, employee: employee, customer: customer)
    # Ask ORDER REPO to store an instance of order
    @order_repository.create(order)
    # Persist a new order
  end
end
