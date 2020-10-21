require_relative "app/models/order"
require_relative "app/models/meal"
require_relative "app/models/customer"
require_relative "app/models/employee"

pizza = Meal.new(name: "Pizza", price: 4)
caio = Customer.new(name: "Caio", address: "Cuernavaca")
ringo = Employee.new(username: "ringo")

my_order = Order.new(
  meal: pizza,
  customer: caio,
  employee: ringo
)
p my_order
