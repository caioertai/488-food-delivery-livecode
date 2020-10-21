require_relative "app/controllers/customers_controller"
require_relative "app/controllers/meals_controller"
require_relative "app/controllers/orders_controller"
require_relative "app/controllers/sessions_controller"

require_relative "app/repositories/customer_repository"
require_relative "app/repositories/meal_repository"
require_relative "app/repositories/employee_repository"
require_relative "app/repositories/order_repository"

require_relative "router"

meal_repository = MealRepository.new("data/meals.csv")
customer_repository = CustomerRepository.new("data/customers.csv")
employee_repository = EmployeeRepository.new("data/employees.csv")

order_repository = OrderRepository.new(
  "data/orders.csv",
  meal_repository,
  customer_repository,
  employee_repository
)

meals_controller = MealsController.new(meal_repository)
customers_controller = CustomersController.new(customer_repository)
orders_controller = OrdersController.new(order_repository, meal_repository, customer_repository, employee_repository)
sessions_controller = SessionsController.new(employee_repository)

router = Router.new(meals_controller, customers_controller, orders_controller, sessions_controller)
router.run
